{% if site.search.enabled %}
	<script type="text/javascript" src="http://www.google.com/jsapi"></script>
	<script type="text/javascript" src="http://static.edicy.com/assets/site_search/1.0/site_search.min.js?1"></script>
	<script type="text/javascript" charset="utf-8">
        //<![CDATA[
            var search_translations = {"search": "{{ "search"|lc }}", "close": "{{ "search_close"|lc }}", "noresults": "{{ "search_noresults"|lc }}"};
        //]]>
	</script>
{% endif %}
