<!-- Main menu -->
<ul id="mainmenu" class="clearfix">
  {% unless site.root_item.hidden? %}<li{% if site.root_item.current? %} class="active"{% endif %}><a href="{{ site.root_item.url }}">{{site.root_item.title}}</a></li>{% endunless %}
  {% for item in site.visible_menuitems %}
    {% if editmode %}
      <li{% if item.translated? %}{% if item.selected? %} class="active"{% endif %}{% else %} class="untranslated"{% endif %}>
        <a href="{{ item.url }}"{% unless item.translated? %} class="fci-editor-menuadd"{% endunless %}>{{ item.title }}</a>
      </li>
    {% else %}
      {% if item.translated? %}
        <li{% if item.selected? %} class="active"{% endif %}><a href="{{ item.url }}">{{ item.title }}</a>
      {% endif %}
    </li>
    {% endif %}
  {% endfor %}
  {% if editmode %}<li>{% menubtn site.hidden_menuitems %}</li>        
  <li>{% menuadd %}</li>{% endif %}          
</ul>

<!-- //Main menu -->

<!-- Second menu -->
{% if editmode %}
  {% for item in site.menuitems %}
    {% if item.selected? %}
      <ul id="second-menu">
        {% if item.all_children? %}
          {% for level2 in item.visible_children %}
            <li{% unless level2.translated? %} class="untranslated"{% endunless %}>
              <a href="{{ level2.url }}"{% if level2.selected? %} class="active"{%else%}{% unless level2.translated? %} class="fci-editor-menuadd"{% endunless %}{% endif %}>{{ level2.title }}</a>
            </li>
          {% endfor %}
        {% endif %}
        <li>{% menubtn item.hidden_children %}</li>            
        <li>{% menuadd parent="item" %}</li>
      </ul>
    {% endif %}
  {% endfor %}
{% else %}
  {% for item in site.menuitems %}
    {% if item.selected? %}
      {% if item.children? %}
        <ul id="second-menu">
          {% for level2 in item.children %}
            <li><a href="{{ level2.url }}"{% if level2.selected? %} class="active"{% endif %}>{{ level2.title }}</a></li>
          {% endfor %}
        </ul>
      {% endif %}
    {% endif %}
  {% endfor %}
{% endif %}
<!-- //Second menu -->


<!-- Third menu -->
{% if editmode %}
  {% for item in site.menuitems %}
    {% if item.selected? %}
      {% if item.children? %}
        {% for level2 in item.children %}
          {% if level2.selected? %}
            <ul id="third-menu">
              {% if level2.all_children? %}
                {% for level3 in level2.visible_children %}
                  <li{% unless level3.translated? %} class="untranslated"{% endunless %}>
                    <a href="{{ level3.url }}"{% if level3.selected? %} class="active"{%else%}{% unless level3.translated? %} class="fci-editor-menuadd"{% endunless %}{% endif %}>{{ level3.title }}</a>
                  </li>
                {% endfor %}
              {% endif %}
              <li>{% menubtn level2.hidden_children %}</li>                    
              <li>{% menuadd parent="level2" %}</li>
            </ul>
          {% endif %}
        {% endfor %}
      {% endif %}
    {% endif %}
  {% endfor %}
{% else %}
  {% for item in site.menuitems %}
    {% if item.selected? %}
      {% if item.children? %}
        {% for level2 in item.children %}
          {% if level2.selected? %}
            {% if level2.children? %}
              <ul id="third-menu">
                 {% for level3 in level2.children %}
                   <li><a href="{{ level3.url }}"{% if level3.selected? %} class="active"{% endif %}>{{ level3.title }}</a></li>
                 {% endfor %}
              </ul>
            {% endif %}
          {% endif %}
        {% endfor %}
      {% endif %}
    {% endif %}
  {% endfor %}
{% endif %}
<!-- //Third menu -->


