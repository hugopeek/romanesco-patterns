[[+errors:notempty=`<div class="ui error message">[[+errors]]</div>`]]

<form class="ui [[+form_size]] form" action="[[~[[*id]]]]" method="post">
    <div class="field">
        <label for="login-name">[[%login.username]]</label>
        <input id="login-name" name="username" type="text">
    </div>
    <div class="field">
        <label for="login-password">[[%login.password]]</label>
        <input id="login-password" type="password" name="password">
    </div>
    [[+login.recaptcha_html]]
    <input type="hidden" name="returnUrl" value="[[+request_uri]]">
    <input type="hidden" name="service" value="login">
    <button name="login" class="ui [[+form_size]] button" type="submit">[[+actionMsg]]</button>
</form>

[[!fbLoadAssets]]