---
layout: page
title: Rails
permalinks: /knowhows/rails/

---

# Ruby on Rails に関するノウハウ

<div class="section-index">
  <hr class="panel-line">
  {% for p in site.knowhows %}
    {% if p.url contains '/knowhows/rails/' %}
      <div class="entry">
        <h5><a href="{{ p.url | prepend: site.baseurl }}">{{ p.title }}</a></h5>
        <p>{{ p.description }}</p>
      </div>
    {% endif %}
  {% endfor %}
</div>

## Docker開発での注意
DockerでRailsを開発する場合、ファイルの更新検知を変える必要がある
```ruby
# config/environments/development.rb
config.file_watcher = ActiveSupport::FileUpdateChecker
```
