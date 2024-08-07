[[+errors:notempty=`<div class="ui tiny error message">[[+errors]]</div>`]]

<form id="form-login" class="ui right dropdown item" action="[[~[[*id]]]]" method="post">
    [[+actionMsg]]
    <i class="dropdown icon"></i>

    <div class="menu">
        <div class="ui left icon input">
            <i class="user icon"></i>
            <input id="login-name" name="username" type="text" placeholder="[[%login.username]]">
        </div>
        <div class="ui left icon input">
            <i class="user secret icon"></i>
            <input id="login-password" name="password" type="password" placeholder="[[%login.password]]">
        </div>
        <input type="hidden" name="returnUrl" value="[[+request_uri]]">
        <input type="hidden" name="service" value="login">

        <div class="divider"></div>

        <div class="submit item">
            <i class="sign-in icon"></i>
            [[+actionMsg]]
        </div>
    </div>
</form>

[[!fbLoadAssets]]