# Содержание

Для создания документации создайте директорию с любым именем и скопируйте в неё
файл `ReadMe.md`.  
Для сортировки документов необходимо создать аттрибут:
```
---
sort: N
---
```

![Octocat](https://github.githubassets.com/images/icons/emoji/octocat.png)

{% include list.liquid all=true %}


page_path: `{{ page.path }}`

```
{% raw %}{% include list.liquid all=true %}{% endraw %}

{% include list.liquid all=true %}
```
