---
sort: 3
---

# Ошибка чтения макросом файла

|MS Excel|14.0.7015.1000
|:--- |:--- 
|Формат|xls

``` danger
**2021-09-15**  
Ошибка 80070bbc возникает из-за работы с книгой в различных версиях Excel.  
![Ошибка -2147021892](images/error_80070bbc.jpg)
```

## Разрешение конфликта

1. Добавить атрибут `Только чтение` для рабочей книги на сетевом диске.

2. Скопировать рабочую книгу во временную папку на локальный диск.

3. Открыть книгу, и разрешить редактирование.  
``` mermaid
graph LR
  %% https://mermaid-js.github.io/mermaid-live-editor/
  %% https://fontawesome.ru/all-icons/
  m1(fa:fa-caret-down Файл) --> m2
  m2(Сведения) --> |ПКМ| b1
  b1([fa:fa-pencil-square-o Все равно редактировать])
  style b1 fill:#f9f9f9,stroke:#a0a0a0,stroke-width:2px
  classDef confmenu fill:#ecf9e7,stroke:#32ad15,stroke-width:1px,color:#23850f
  class m1,m2 confmenu
```
![Защищенный просмотр](images/protected_view.png)

4. Сохранить книгу в формате `xlsm`. Затем открыть книгу и сохранить в исходном формате `xls`.

5. Заменить рабочую книгу на сетевом диске полученной копией книги с восстановленной структурой.
