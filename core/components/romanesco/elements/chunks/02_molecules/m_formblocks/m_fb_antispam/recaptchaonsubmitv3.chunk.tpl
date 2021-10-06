<div id="rc-root-[[+action_key]]-[[+form_id]]">
    <input type="hidden" name="[[+token_key]]">
    <input type="hidden" name="[[+action_key]]" value="[[+form_id]]">
    <input type="hidden" name="submit-[[*alias]]" value="1">
</div>

<p class="recaptcha notice">
    <small>[[%formblocks.form.recaptchav3_legal_notice]]</small>
</p>

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

        // Polyfill for closest() and matches() for IE9+
        if (!Element.prototype.matches) {
            Element.prototype.matches =
                Element.prototype.msMatchesSelector ||
                Element.prototype.webkitMatchesSelector;
        }

        if (!Element.prototype.closest) {
            Element.prototype.closest = function(s) {
                var el = this;

                do {
                    if (Element.prototype.matches.call(el, s)) return el;
                    el = el.parentElement || el.parentNode;
                } while (el !== null && el.nodeType === 1);
                return null;
            };
        }
    });
</script>
