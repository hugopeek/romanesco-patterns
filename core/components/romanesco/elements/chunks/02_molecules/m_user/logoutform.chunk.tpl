[[+errors:notempty=`<div class="ui error message">[[+errors]]</div>`]]

<div class="ui equal width middle aligned grid">
    <div class="ui column">
        You are logged in as <strong>[[!+modx.user.id:userinfo=`username`]]</strong>
    </div>
    <div class="ui compact column">
        <a href="[[+logoutUrl]]" title="[[+actionMsg]]" class="ui button">[[+actionMsg]]</a>
    </div>
</div>

[[!fbLoadAssets]]