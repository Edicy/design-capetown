<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">
<head>
	{% include "SiteHeader" %}
        {{ blog.rss_link }}
</head>
<body>

<div id="wrap">
    <div id="container">
      
      <div id="topbar">
        
        {% include "Search" %}
        
        {% include "Langmenu"%}
        
      </div> <!-- //topbar -->
      
      <div id="header" class="clearfix">{% editable site.header %}</div>
      
      {% include "Menu" %}
      
      <div id="content" class="clearfix">
        {% addbutton class="add-article" %}
        
        {% for article in articles %}
        <div class="news-block{% if forloop.last %} news-block-last{% endif%}">
          <h1><a href="{{ article.url }}">{{ article.title }}</a></h1>
          <div class="news-date">{{ article.created_at | format_date : "%B %d, %Y" }}</div>
          {{ article.excerpt }} <a href="{{ article.url }}">{{ "read_more"|lc}} &raquo;</a>
        </div> <!-- //news-block -->
        {% endfor %}
      </div> <!-- //content -->
      
      <div id="footer" class="clearfix">
        <div id="edicy">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
        <div id="footer-inner" class="clearfix">
          {% xcontent name="footer" %}
        </div> <!-- //footer-inner -->
      </div> <!-- //footer -->
      
    </div> <!-- //container -->
  </div> <!-- //wrap -->
{% unless editmode %}{{ site.analytics }}{% endunless %}
  {% include "JS" %}
</body>
</html>
