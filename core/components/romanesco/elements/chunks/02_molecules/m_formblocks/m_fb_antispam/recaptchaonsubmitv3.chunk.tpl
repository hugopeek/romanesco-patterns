<div id="rc-root-[[+action_key]]-[[+form_id]]">
    <input type="hidden" name="[[+token_key]]">
    <input type="hidden" name="[[+action_key]]" value="[[+form_id]]">
    <input type="hidden" name="submit-[[*alias]]" value="1">
</div>

<p class="recaptcha help">
    [[%formblocks.form.recaptchav3_legal_notice]]
</p>

[[++formblocks.frontend_validation:isnot=`1`:then=`
<script>
    window.addEventListener('DOMContentLoaded', function() {

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

        form.addEventListener('submit', function(e) {
            e.preventDefault();

            grecaptcha.ready(function() {
                grecaptcha.execute('[[+site_key]]', {action: '[[+form_id]]'}).then(function(token) {
                    rcr.querySelector('[name="[[+token_key]]"]').value = token;
                    form.submit();
                });
            });
        });
    });
</script>
`]]