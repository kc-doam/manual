---
sort: 1
---

# Обновление платформы не изменяя информационную базу

|1C:Предприятие|8.3.24.1691
|:--- |:--- 
|Документооборот КОРП|2.1.29.17
|Расширение ДОАМ|[2.0.0]

[2.0.0]: https://github.com/kc-doam/doam.cfe/releases

``` note
Если конфигурация открыта, то пропустите пункт 1.
```

## Решение вопроса

``` tip
Перед выполнением действий создайте копию информационной базы.
```

1. Открыть `Конфигурацию` в режиме конфигуратора, - слева откроется окно  
``` mermaid
graph LR
  %% https://mermaid-js.github.io/mermaid-live-editor/
  %% https://fontawesome.ru/all-icons/
  b1([fa:fa-external-link Конфигуратор]) -.-> |ЛКМ| m1
  m1("Конфигурация [меню]") --> m2
  m2(Открыть конфигурацию) -.-> |ЛКМ| element
  element[fa:fa-window-restore Конфигурация]
  style b1 fill:#f9f9f9,stroke:#a0a0a0,stroke-width:2px
  style element fill:#fff,stroke:#a0a0a0,stroke-width:2px,stroke-dasharray:2 4
  classDef confmenu fill:#d6e9ff,stroke:#9eb6e9,stroke-width:1px,color:#3d4e8f
  class m1,m2 confmenu
```
``` tip
Если панель `Конфигурация` закрыта, то отобразить окно можно горячими клавишами [`Ctrl+Shift+C`](#)
```

2. Перед сравнением-объединением с новой версией удалить общие формы и регистры:  
	* ЗагрузкаДанныхИзСервиса  
	* АдресныеОбъекты  
``` note
В версии `2.1.29` вместо перечисленных добавлены объекты с такими же именами, но с другой структурой.
```

3. В действительности с конфигурацией от стороннего производителя будет сделать невозможно,  
поэтому сразу запустить `Обновить конфигурацию...` и меню `Поддержка`.  
``` mermaid
graph LR
  %% https://mermaid-js.github.io/mermaid-live-editor/
  %% https://fontawesome.ru/all-icons/
  m1("Конфигурация [меню]") --> m2
  m2("Поддержка") -.-> |ЛКМ| m3
  m3("Обновить конфигурацию...")
  classDef confmenu fill:#d6e9ff,stroke:#9eb6e9,stroke-width:1px,color:#3d4e8f
  class m1,m2,m3 confmenu
```

4. Выбрать файл обновления, который по умолчанию скачивается в директорию 
`%AppData%\1C\1cv8\tmplts\1c\`, и нажать кнопку `Готово`, затем `Продолжить обновление`.  

5. Необходимо сравнить поставщика обновления, нажать кнопку `ОК` и подождать сравнение конфигураций.  
![Запрос обновления](images/upgrade_cfu_2_1.png)
``` note
После появления окна необходимо найти и установить галки напротив объектов, указанных в пункте 2. Затем нажать кнопку `Выполнить`.  
На сообщение `Будет произведена замена объектов. Продолжить?` ответить `Да`, затем нажать `OK`.  
Расширение в режиме "адаптация" перед обновлением отключать не требуется.  
```
После появления сообщения с реорганизацией базы (после реструктуризации) нажмите кнопку `Принять`.  

6. После обовления конфигурации нажать клавишу `F7`.  
В результате успешного обновления во время очередного запуска информационной базы 
появится сообщение с обновлением, а затем и сообщение с окончанием обносления.  
![Процесс обновления](images/upgrade_cfu_2_2.png)

7. Режим совместимости расширения конфигурации `Не использовать`.  
Режим совместимости `Не использовать`.

