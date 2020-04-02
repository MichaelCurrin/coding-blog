{% comment %}Markdown in description will be rendered{% endcomment %}
{% for link in page.links %}
- [{{ link.title }}]({{ link.url }})
{% if link.description %}  - {{ link.description }}{% endif %}
{% endfor %}
