---
layout: page
title: Rspec
permalink: /knowhows/rspec

---

# Rspec
<div class="section-index">
  <hr class="panel-line">
  {% for p in site.knowhows %}
    {% if p.url contains '/knowhows/rspec/' %}
      <div class="entry">
        <h5><a href="{{ p.url | prepend: site.baseurl }}">{{ p.title }}</a></h5>
        <p>{{ p.description }}</p>
      </div>
    {% endif %}
  {% endfor %}
</div>
