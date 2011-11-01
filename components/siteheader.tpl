	<title>{% if article %}{{ article.title }} | {{site.name}}{% else %}{{ site.name }} | {{ page.title }}{% endif %}</title>
        <meta name="keywords" content="{{ page.keywords }}" />
	<meta name="description" content="{{ page.description }}" />
	<meta name="copyright" content="{{ site.copyright }}" />
	<meta name="author" content="{{ site.author }}" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	{% stylesheet_link "style.css?capetown" %}
        <!--[if IE]>{% stylesheet_link "style_ie.css?capetown" %}<![endif]-->
	{% if editmode %}{% stylesheet_link "assets/admin/editmode.css" static_host="true" %}{% endif %}

	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="/favicon.ico" type="image/ico" />
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
         <meta name="viewport" content="initial-scale=1" />
        
        {% if site.search.enabled %}{% stylesheet_link "assets/site_search/1.0/site_search.css" static_host="true" %}{% endif %}
