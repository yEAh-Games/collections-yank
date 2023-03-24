---
layout: null
---

{% for post in site.posts %}
  {% if post.permalink != post.url %}
    {% capture redirect_from_url %}{{ post.url | remove_first: site.baseurl }}{% endcapture %}
    {% capture redirect_to_url %}{{ post.permalink | remove_first: site.baseurl }}{% endcapture %}

    {% assign redirect_from = redirect_from | push: redirect_from_url %}
    {% assign redirect_to = redirect_to | push: redirect_to_url %}
  {% endif %}
{% endfor %}

{% for redirect in redirect_from %}
---
permalink: {{ redirect }}
redirect_from:
{% for url in redirect_to %}
  - {{ url }}
{% endfor %}
---
{% endfor %}
