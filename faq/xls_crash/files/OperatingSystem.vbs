' Copyright (c) 1997-1999 Microsoft Corporation
'************************************************************************** ** *
'
' WMI Sample Script - Information about the OS (VBScript)
'
' This script demonstrates how to retrieve the info about the OS 
' on the local machine from instances of Win32_OperatingSystem.
'
'************************************************************************** ** *
Option Explicit

CONST VERSION = "0.02.000"

CONST OfficeAppId = "0ff1ce15-a989-479d-af46-f275c6370663" ' MS Office 2013-2019

CONST WmiQuery1 = "ID, ApplicationId, EvaluationEndDate, PartialProductKey, Description, Name, LicenseStatus, LicenseStatusReason, ProductKeyID, GracePeriodRemaining, "
CONST WmiQuery2 = "DiscoveredKeyManagementServiceMachineName, DiscoveredKeyManagementServiceMachinePort, VLActivationInterval, VLRenewalInterval, KeyManagementServiceMachine, KeyManagementServicePort, ProductKeyID2"
CONST KeyPath = "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DigitalProductId"

Public Win7, Win8, productClass, productinstances, LicenseStatus


Function performLicence()
	Dim instance, objService
	
	Call setWinOS

	If Win7 = True Then
		productClass = "OfficeSoftwareProtectionProduct"
		ExecuteQuery WmiQuery1 & WmiQuery2, "ApplicationId = '" & OfficeAppId & "' ", productClass
	Else
		productClass = "SoftwareLicensingProduct"
		ExecuteQuery WmiQuery1 & "KeyManagementServiceLookupDomain, VLActivationType, ADActivationObjectName, ADActivationObjectDN, ADActivationCsvlkPid, ADActivationCsvlkSkuId, VLActivationTypeEnabled, " _
			& WmiQuery2, "ApplicationId = '" & OfficeAppId & "' ", productClass
	End If
	
	For Each instance In productinstances
		If (LCase(instance.ApplicationId) = OfficeAppId) Then
			LicenseStatus = -1
			If instance.LicenseStatus = 1 Then LicenseStatus = 1
		End If
	Next 'instance
End Function

Function ExecuteQuery(strSelect, strWhere, strClass)
	'Set objWMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
	'Set colOperatingSystems = GetObject("winmgmts:").ExecQuery("Select * from Win32_OperatingSystem")
	
	If strWhere = "" Then
		Set productinstances = objWMI.ExecQuery("SELECT " & strSelect & " FROM " & strClass)
	Else
		Set productinstances = objWMI.ExecQuery("SELECT " & strSelect & " FROM " & strClass & " WHERE " & strWhere)
	End If
End Function

Private Function setWinOS()
	Dim Ver
	
	Set objWMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
	Set colOperatingSystems = GetObject("winmgmts:").InstancesOf("Win32_OperatingSystem")

	For Each objOperatingSystem In colOperatingSystems
		Ver = Split(objOperatingSystem.VERSION, ".", -1, 1)
		' Win7/Server2008R2
		If (Ver(0) = "6" And Ver(1) = "1") Then
			Win7 = True
			Exit For
		End If
			
		' Win8/Server2012
		If (Ver(0) = "6" And Ver(1) = "2") Then
			Win8 = True
			Exit For
		End If
	Next 'objOperatingSystem
End Function

'************************************************************************** ** *
Function quitExit()
	Set productinstances = Nothing
	Set colOperatingSystems = Nothing
	Set objWMI = Nothing
	Set objShell = Nothing
	Set objExcelApp = Nothing

	'WScript.Echo "---Exiting---"
	WScript.Quit
End Function

Private Function ExtractKey(KeyInput)
	Dim CharWhitelist, Cur, KeyOutput, i, x
	
	CONST KeyOffset = 52
	i = 28
	CharWhitelist = "BCDFGHJKMPQRTVWXY2346789"
	Do
		Cur = 0
		x = 14
		Do
			Cur = Cur * 256
			Cur = KeyInput(x + KeyOffset) + Cur
			KeyInput(x + KeyOffset) = (Cur \ 24) And 255
			Cur = Cur Mod 24
			x = x - 1
		Loop While x >= 0
		i = i - 1
		KeyOutput = Mid(CharWhitelist, Cur + 1, 1) & KeyOutput
		If (29 - i) Mod 6 = 0 And Not i = -1 Then
			i = i - 1
			KeyOutput = "-" & KeyOutput
		End If
	Loop While i >= 0
	ExtractKey = KeyOutput
End Function

'Private Sub Auto_Load()
	Dim objExcelApp, objShell, objWMI, objOperatingSystem, colOperatingSystems

	On Error Resume Next

	Set objExcelApp = CreateObject("Excel.Application")
	Set objShell = CreateObject("WScript.Shell")

	''cmd.exe /c cscript "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" /dstatus
	Call performLicence
	
	If LicenseStatus = -1 Then LicenseStatus = "---UNLICENSED--- "
	If LicenseStatus = 1 Then LicenseStatus = "---LICENSED--- "
	For Each objOperatingSystem In colOperatingSystems
		Wscript.Echo "Windows Serial key copied to Clipboard" & vbCrLf & vbCrLf _
			& objOperatingSystem.Caption & " (" & objOperatingSystem.OSArchitecture & ")" & vbCrLf _
			& "Windows Product ID: " & objOperatingSystem.SerialNumber & vbCrLf _
			& "Windows Version: " & objOperatingSystem.Version & vbCrLf _
			& "Locale: " & objOperatingSystem.Locale & vbCrLf & LicenseStatus & "Excel Version: " _
			& objExcelApp.VERSION & "." & objExcelApp.Build & vbCrLf & vbCrLf _
			& "Windows Directory: " & objOperatingSystem.WindowsDirectory & vbCrLf _
			& "Script Path:", WScript.ScriptFullName & vbCrLf _
			& "" '& ExtractKey(objShell.RegRead(KeyPath))
	Next 'objOperatingSystem

	objShell.Run "cmd.exe /c echo " & ExtractKey(objShell.RegRead(KeyPath)) & " | clip", 0, TRUE

	Call quitExit
'End Sub
