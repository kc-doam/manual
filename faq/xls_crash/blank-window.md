---
sort: 4
---

# Вместо открытия файла видно пустое окно

|MS Excel|16.0.4266.1001
|:--- |:--- 
|Формат|csv, xls, xlsm, xlsx

``` danger
**2022-01-17**  
В Windows 10 при открытии файла Excel вместо данных приложение открывает пустое окно.  
Проблема может возникать после [обновления Windows](//ru.wikipedia.org/wiki/WSUS) (без уведомления пользователя).
```

## Разрешение конфликта

1. В запущенном приложении открыть Параметры Excel.   
``` mermaid
graph LR
  %% https://mermaid-js.github.io/mermaid-live-editor/
  %% https://fontawesome.ru/all-icons/
  m1("fa:fa-caret-down Файл [меню]") --> m2
  m2(Параметры) -.-> |ЛКМ| b1
  b1("Дополнительно #lbrack;раздел#rbrack;") --> b2
  b2("Общие [группа]") -.-> |ЛКМ| element
  element[fa:fa-square-o Игнорировать DDE-запросы...]
  style element fill:#fff,stroke:#a0a0a0,stroke-width:2px,stroke-dasharray:2 4
  classDef confmenu fill:#ecf9e7,stroke:#32ad15,stroke-width:1px,color:#23850f
  classDef section fill:#f9f9f9,stroke:#a0a0a0,stroke-width:2px
  class m1,m2 confmenu
  class b1,b2 section
```
![Параметры Excel](images/blank_window.png)

2. Найти настройку `Игнорировать DDE-запросы от других приложений` и снять галку.

3. Нажать `Ок`. Проблема должна разрешиться.

