# Экспорт файлов расширения ДОАМ

|1C:Предприятие|8.3.17.1851
|:--- |:--- 
|Документооборот КОРП|2.1.10.2
|Расширение ДОАМ|[1.2.2]

[1.2.2]: //github.com/kc-doam/doam.cfe/releases

``` note
Если конфигурация открыта, то пропустите пункт 1.
```

## Решение вопроса

1. Открыть `Конфигурацию` в режиме конфигуратора (слева откроется окно)  
``` mermaid
graph LR
  %% https://mermaid-js.github.io/mermaid-live-editor/
  %% https://fontawesome.ru/all-icons/
  b1([fa:fa-external-link Конфигуратор]) -.-> |ЛКМ| m1
  m1(fa:fa-caret-down Конфигурация) --> m2
  m2(Открыть конфигурацию) -.-> |ЛКМ| element
  element[fa:fa-window-restore Расш...]
  style b1 fill:#f9f9f9,stroke:#a0a0a0,stroke-width:2px
  style element fill:#fff,stroke:#a0a0a0,stroke-width:2px,stroke-dasharray:2 4
  classDef confmenu fill:#d6e9ff,stroke:#9eb6e9,stroke-width:1px,color:#3d4e8f
  class m1,m2 confmenu
```
``` tip
Если `Конфигурация` открыта, показать окно можно горячими клавишами 
[`Ctrl+Shift+C`](#)
```

2. Выбрать меню `Выгрузить конфигурацию в файлы` и указать путь `REPO\src\cfe`
``` mermaid
graph LR
  %% https://mermaid-js.github.io/mermaid-live-editor/
  %% https://fontawesome.ru/all-icons/
  b1([fa:fa-external-link Конфигуратор]) -.-> |ЛКМ| m1
  m1(fa:fa-caret-down Конфигурация) --> m2
  m2(Выгрузить конфигурацию в файлы...) -.-> |ЛКМ| element
  element[fa:fa-folder-open Выбрать] --> b2
  b2([Выполнить])
  classDef button fill:#f9f9f9,stroke:#a0a0a0,stroke-width:2px
  style element fill:#fff,stroke:#a0a0a0,stroke-width:2px,stroke-dasharray:2 4
  classDef confmenu fill:#d6e9ff,stroke:#9eb6e9,stroke-width:1px,color:#3d4e8f
  class m1,m2 confmenu
  class b1,b2 button
```

3. В случае необходимости подтвердить действие

