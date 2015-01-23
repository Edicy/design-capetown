<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">
<head>
	{% include "SiteHeader" %}
</head>
<body>

<div id="wrap"{% if editmode %} class="editmode"{% endif %}>
    <div id="container">

      <div id="topbar" class="content-hyphenate">

        {% include "Search" %}

        {% include "Langmenu"%}

      </div> <!-- //topbar -->

      <div id="header" class="clearfix content-hyphenate">{% editable site.header %}</div>

      {% include "Menu" %}

      <div id="content" class="clearfix content-hyphenate">
        {% content %}
      </div> <!-- //content -->

      <div id="footer" class="clearfix content-hyphenate">
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
