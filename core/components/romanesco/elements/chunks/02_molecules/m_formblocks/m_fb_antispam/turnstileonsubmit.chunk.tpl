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
        const submitButton = form.querySelector('input[name="fb[[+form_id]]-submit"][type="submit"]');
        const errorMessage = form.querySelector('.ui.error.message');

        if (!form) {
            console.error('Turnstile couldn\'t find its parent form.');
            return;
        }
        if (!submitButton) {
            console.debug('Turnstile couldn\'t find the submit button.');
            return;
        }

        submitButton.classList.add('disabled');

        // Failsafe: check for Turnstile completion if callback fails
        let enableCheckInterval = setInterval(function() {
            const turnstileResponse = form.querySelector('input[name="cf-turnstile-response"]');
            if (turnstileResponse && turnstileResponse.value) {
                submitButton.classList.remove('disabled');
                clearInterval(enableCheckInterval);
            }
        }, 500);

        // Clear interval after 10 seconds
        setTimeout(function() {
            clearInterval(enableCheckInterval);
        }, 10000);

        window.onTurnstileSuccess[[+form_id]] = function (token) {
            //console.log('Challenge success', token);
            clearInterval(enableCheckInterval);
            submitButton.classList.remove('disabled');
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
            submitButton.classList.add('disabled');
        }
    });
</script>
