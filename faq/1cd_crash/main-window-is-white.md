---
sort: 1
---

# После обновления пустой экран

|1C:Предприятие|8.3.17.1851
|:--- |:--- 
|Документооборот КОРП|2.1.10.2
|Расширение ДОАМ|[1.2.1]

[1.2.1]: //github.com/kc-doam/doam.cfe/releases

``` danger
**2020-12-24**  
После обновления компонентов C++ на Начальной странице клиента (Рабочий стол) 
отображается только белый экран.
```

## Разрешение конфликта

1. Открыть `Конфигурацию` в режиме конфигуратора (слева откроется окно)  
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
Если `Конфигурация` открыта, показать окно можно горячими клавишами 
[`Ctrl+Shift+C`](#{{ page.url }})
```

2. Проверить настройки Начальной страницы `Конфигурации` в поле `Шаблон 
начальной страницы`
``` mermaid
graph LR
  subgraph new[fa:fa-window-maximize Рабочая область начальной страницы]
    i1[fa:fa-pencil-square-o Шаблон начальной страницы] -.-> e30 & e40 & e50
    e30[Одна колонка]
    e40[Две колонки одинаковой ширины]
    e50["Две колонки разной ширины (2:1)"]
  end
  subgraph main[" "]
    e10[fa:fa-plus-square-o ДокументооборотКОРП] -- ПКМ --> m1
    m1(Открыть рабочую область начальной страницы) -.-> |ЛКМ| e20
    e20[fa:fa-window-maximize Рабоч...]
  end
  style i1 fill:#fff,stroke:#000,stroke-width:2px
  style m1 fill:#d6e9ff,stroke:#9eb6e9,stroke-width:1px,color:#3d4e8f
  style main fill:none,stroke:none
  classDef element fill:#fff,stroke:#a0a0a0,stroke-width:2px,stroke-dasharray:2 4
  class e10,e20,e30,e40,e50 element
```

3. Открыть `РасширениеДОАМ` и установить `Шаблон начальной страницы` как в 
`Конфигурации`
``` mermaid
graph LR
  m1("Конфигурация <b>[меню]</b>") --> m2
  m2(Расширения конфигурации) -.-> |ЛКМ| e10
  e10[fa:fa-window-restore Расширения конфигурации]
  e20[fa:fa-list-alt РасширениеДОАМ 1.x.x] -.-> m3
  m3(fa:fa-caret-down Конфигурация) --> m4
  m4(Открыть конфигурацию) -.-> |ЛКМ| e30
  e30[fa:fa-plus-square-o РасширениеДОАМ]
  classDef confmenu fill:#d6e9ff,stroke:#9eb6e9,stroke-width:1px,color:#3d4e8f
  classDef element fill:#fff,stroke:#a0a0a0,stroke-width:2px,stroke-dasharray:2 4
  class m1,m2,m3,m4 confmenu
  class e10,e20,e30 element
```  
Установить `Шаблон начальной страницы` как указано в предыдущем пункте.  
Далее нужно `Обновить конфигурацию базы данных` клавишей [`F7`](#{{ page.meta.1C:ExtensionDOAM }}).

