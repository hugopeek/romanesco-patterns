[[!setUserPlaceholders? &userId=`[[+tv.article_author]]`]]

<[[+title_hierarchy]] class="ui header">
    <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
</[[+title_hierarchy]]>

<p class="meta">
    <a href="[[~[[+team_member_id]]]]" class="ui avatar image">
        <img src="[[ImagePlus:empty=`[[++overview_img_fallback]]`? &tvname=`team_member_image` &docid=`[[+team_member_id]]` &options=`w=150&h=150&zc=1` &type=`thumb`]]">
    </a>
    <span class="author">[[+tv.article_author:userinfo=`fullname`:empty=`[[++site_name]]`]]</span>
    <span class="date">
        <i class="icon calendar"></i>
        [[+publishedon:strtotime:date=`%e %B %Y`]]
    </span>
    <span class="comments">
        <i class="icon comments"></i>
        <a href="[[~[[+id]]? &scheme=`full`]]#disqus_thread">Comments</a>
    </span>
</p>

<p class="description">
    [[+introtext:stripString=`<p>`:stripString=`</p>`]]
</p>

<div class="ui divider"></div>

<div class="ui tag labels">
    [[!TaggerGetTags? &resources=`[[+id]]` &rowTpl=`tagItemBasic`]]
</div>

[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`[[!$buttonHrefOverview? &classes=`tiny right floated`]]`
]]