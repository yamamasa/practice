---
layout: page
title: Rails
---

# Ruby on Rails に関するノウハウ

<div class="section-index">
    <hr class="panel-line">
    {% for post in site.knowhows.rails  %}
    <div class="entry">
    <h5><a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a></h5>
    <p>{{ post.description }}</p>
    </div>{% endfor %}
</div>
