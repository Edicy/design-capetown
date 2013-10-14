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
        <div class="news-block news-block-last">
          <h1>{% editable article.title %}</h1>
          <div class="news-date">{{ article.created_at | format_date : "%B %d, %Y" }}</div>
          <div style="padding-bottom: 10px; font-weight: bold;" class="clearfix">
            {% editable article.excerpt %}
          </div>
          {% editable article.body %}
          
          {% if editmode %}
            <div class="cfx article-tags">
                <div class="article-tag-icon"></div>
                {% editable article.tags %}
            </div>
          {% else %}
            {% unless article.tags == empty %}
                <div class="cfx article-tags">
                    <div class="article-tag-icon"></div>
                    {% for tag in article.tags %}
                        <a href="{{ article.page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}
                    {% endfor %}
                </div>
            {% endunless %}
          {% endif %}

          
          <div id="comments">

            {% if article.comments_count > 0 %}
              <h3>{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span>
</h3>
            
              {% for comment in article.comments %}
                <div class="comment clearfix edy-site-blog-comment">
                  <div class="comment-left">
                    <b>{{ comment.author }}</b> {% removebutton %}<br />
                    <span>{{ comment.created_at | format_date : "%B %d, %Y" }}</span>
                  </div> <!-- //comment-left -->
                  <div class="comment-right">
                    {{ comment.body_html }}
                  </div> <!-- //comment-right -->
              </div> <!-- //comment -->
              {%endfor%}
            {% endif %}
    
            
            <div id="comment-form">
              
              {% commentform %}
                <h3>{{"add_a_comment"|lc}}</h3>
                <table>
                  {% unless comment.valid? %}
                  <tr>
                    <td class="first"></td>
                    <td>
                      <ul class="comment-error">
                        {% for error in comment.errors %}
                          <li>{{ error | lc }}</li>
                        {% endfor %}
                      </ul>
                    </td>
                  </tr>
                  {% endunless %}
                
                  <tr>
                    <td class="first">{{"name"|lc}}</td>
                    <td><input type="text" name="comment[author]" class="textbox" value="{{comment.author}}" /></td>
                  </tr>
                  <tr>
                    <td class="first">{{"email"|lc}}</td>
                    <td><input type="text" name="comment[author_email]" class="textbox" value="{{comment.author_email}}" /></td>
                  </tr>
                  <tr>
                    <td class="first">{{"comment"|lc}}</td>
                    <td><textarea class="textbox" name="comment[body]" cols="40" rows="5">{{comment.body }}</textarea></td>
                  </tr>
                  <tr>
                    <td></td>
                    <td><input type="submit" class="submit" value="{{"add_a_comment"|lc}}" /></td>
                  </tr>
                </table>
              {% endcommentform %}
            </div> <!-- //comment-form -->
            
          </div> <!-- //comments -->
        </div> <!-- //news-block -->
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

