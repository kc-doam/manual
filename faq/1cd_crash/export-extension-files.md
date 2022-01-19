---
sort: 2
---

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

1. Открыть `Конфигурацию` в режиме конфигуратора, - слева откроется окно  
``` mermaid
graph LR
  %% https://mermaid-js.github.io/mermaid-live-editor/
  %% https://fontawesome.ru/all-icons/
  b1([fa:fa-external-link Конфигуратор]) -.-> |ЛКМ| m1
  m1("Конфигурация <b>[меню]</b>") --> m2
  m2(Открыть конфигурацию) -.-> |ЛКМ| element
  element[fa:fa-window-restore Конфигурация]
  style b1 fill:#f9f9f9,stroke:#a0a0a0,stroke-width:2px
  style element fill:#fff,stroke:#a0a0a0,stroke-width:2px,stroke-dasharray:2 4
  classDef confmenu fill:#d6e9ff,stroke:#9eb6e9,stroke-width:1px,color:#3d4e8f
  class m1,m2 confmenu
```
``` tip
Если панель `Конфигурация` закрыта, то отобразить окно можно горячими клавишами 
[`Ctrl+Shift+C`](#)
```

2. Выбрать меню `Выгрузить конфигурацию в файлы` и указать путь `REPO\src\cfe`
``` mermaid
graph LR
  %% https://mermaid-js.github.io/mermaid-live-editor/
  %% https://fontawesome.ru/all-icons/
  m1("Конфигурация <b>[меню]</b>") --> m2
  m2(Расширения конфигурации) -.-> |ЛКМ| m3
  m3(fa:fa-caret-down Конфигурация) --> m4
  m4(Выгрузить конфигурацию в файлы...) -.-> |ЛКМ| element
  element[fa:fa-folder-open Выбрать] --> b1
  b1([Выполнить])
  classDef button fill:#f9f9f9,stroke:#a0a0a0,stroke-width:2px
  style element fill:#fff,stroke:#a0a0a0,stroke-width:2px,stroke-dasharray:2 4
  classDef confmenu fill:#d6e9ff,stroke:#9eb6e9,stroke-width:1px,color:#3d4e8f
  class m1,m2,m3,m4 confmenu
  class b1 button
```

3. В случае необходимости подтвердить действие

