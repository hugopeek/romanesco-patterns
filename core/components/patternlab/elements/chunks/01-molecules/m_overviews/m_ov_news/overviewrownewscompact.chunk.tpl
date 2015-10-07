<div class="ui padded down pointing segment secondary">
    <h2><a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a></h2>
    <p class="quote">[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
</div>

<div class="ui basic segment">
    <img class="ui avatar image" src="[[pThumb? &input=`[[++overview_img_fallback]]` &options=`w=150&h=150&zc=1`]]">
    <span class="meta"><em>Geschreven door <a href="#">[[+createdby:userinfo=`fullname`:empty=`Daniel Hoopman`]]</a> op [[+publishedon:strtotime:date=`%e %B %Y`]]</em></span>
    <a href="[[~[[+id]]]]" class="ui right floated small secondary button">[[+link_text]]</a>
</div>