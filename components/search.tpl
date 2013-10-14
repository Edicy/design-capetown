{% if site.search.enabled %}
  <div id="search-container" class="clearfix">
    <form id="search" action="" class="edys-search">
      <div>
        <input type="text" class="textbox edys-search-input" value="" id="onpage_search" placeholder="{{ "search"|lc }}" />
        <input type="submit" value="{{'search'|lc}}" class="submit" />
      </div>
    </form> <!-- //search -->
  </div> <!-- //search-container -->
{% endif %}
