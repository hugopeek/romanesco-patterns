var rcr = document.getElementById('rc-root-[[+action_key]]-[[+form_id]]');
if (!rcr) {
    console.error('recaptcha root not found');
    return;
}
var form = rcr.closest('form');
if (!form) {
    console.error('recaptcha root does not appear to be inside a form');
    return;
}

e.preventDefault();
grecaptcha.ready(function() {
    grecaptcha.execute('[[+site_key]]', {action: '[[+form_id]]'}).then(function(token) {
        rcr.querySelector('[name="[[+token_key]]"]').value = token;
        form.submit();
    });
});
