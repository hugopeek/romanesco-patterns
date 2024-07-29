[[+errors:notempty=`<div class="ui error message">[[+errors]]</div>`]]

<div class="ui right simple dropdown item">
    [[!+modx.user.id:userinfo=`username`]]
    <i class="dropdown icon"></i>

    <div class="menu">
        <div class="header">User settings</div>

        <div class="item">My tickets</div>
        <div class="item">My comments</div>

        <div class="divider"></div>

        <a href="[[+logoutUrl]]" title="[[+actionMsg]]" class="item">
            <i class="sign-out icon"></i>
            [[+actionMsg]]
        </a>
    </div>
</div>