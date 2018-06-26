[[+errors:notempty=`<div class="ui error message">[[+errors]]</div>`]]

<div class="ui right labeled icon top right pointing dropdown button">
    <i class="caret down icon"></i>
    <span class="text">[[!+modx.user.id:userinfo=`username`]]</span>
    <div class="menu">
        <div class="header">User settings</div>

        <div class="item">My tickets</div>
        <div class="item">My comments</div>

        <div class="divider"></div>

        <a href="[[+logoutUrl]]" title="[[+actionMsg]]" class="item">
            <i class="sign out icon"></i>
            [[+actionMsg]]
        </a>
    </div>
</div>