<div class="cf-turnstile"
     data-sitekey="[[++formblocks.turnstile_site_key]]"
     data-theme="[[++formblocks.turnstile_theme:default=`light`]]"
     data-size="[[++formblocks.turnstile_size:default=`normal`]]"
     data-callback="onTurnstileSuccess[[+form_id]]"
     data-error-callback="onTurnstileError[[+form_id]]"
     data-expired-callback="onTurnstileExpired[[+form_id]]"
>
</div>

<script>
    window.addEventListener('DOMContentLoaded', function() {

        const form = document.querySelector('form[name="fb[[+form_id]]"]');
        const submit = form.querySelector('input[name="fb[[+form_id]]-submit"][type="submit"]');
        const errorMessage = form.querySelector('.ui.error.message');

        if (!form) {
            console.error('Turnstile couldn\'t find its parent form.');
            return;
        }
        if (!submit) {
            console.debug('Turnstile couldn\'t find the submit button.');
            return;
        }

        submit.classList.add('disabled');

        window.onTurnstileSuccess[[+form_id]] = function (token) {
            //console.log('Challenge success', token);
            submit.classList.remove('disabled');
        }
        window.onTurnstileError[[+form_id]] = function (errorCode) {
            //console.log('Challenge error:', errorCode);
            errorMessage.classList.add('visible');
            if (!errorMessage.textContent.includes('Turnstile')) {
                errorMessage.append('Cloudflare Turnstile was unable to generate a validation token.');
            }
        }
        window.onTurnstileExpired[[+form_id]] = function () {
            console.log('Cloudflare Turnstile token expired');
            submit.classList.add('disabled');
        }
    });
</script>
