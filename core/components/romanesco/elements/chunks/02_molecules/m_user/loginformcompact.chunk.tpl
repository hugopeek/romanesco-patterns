[[+errors:notempty=`<div class="ui tiny error message">[[+errors]]</div>`]]

<form id="form-login" action="[[~[[*id]]]]" method="post">
    <div class="ui right labeled icon top right pointing dropdown button">
        <i class="sign in icon"></i>
        <span class="text">Login</span>
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

            <div class="submit item">
                Login
            </div>
        </div>
    </div>
</form>