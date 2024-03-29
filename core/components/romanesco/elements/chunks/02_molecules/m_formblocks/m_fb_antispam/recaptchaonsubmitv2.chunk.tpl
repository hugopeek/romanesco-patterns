<div class="g-recaptcha" data-sitekey="[[+site_key]]"></div>
<script>
    window.addEventListener('DOMContentLoaded', function () {
        if (window.grcLoaderAdded) {
            return;
        }
        window.grcLoaderAdded = true;

        // Just to make sure (e.g. IE10)
        if (window.NodeList && !NodeList.prototype.forEach) {
            NodeList.prototype.forEach = function (callback, thisArg) {
                thisArg = thisArg || window;
                for (var i = 0; i < this.length; i++) {
                    callback.call(thisArg, this[i], i, this);
                }
            };
        }

        var availableInputs = document.querySelectorAll('input, select');
        if (!availableInputs || !availableInputs.forEach) {
            return;
        }

        var loadGrcOnInteraction = function (ev) {
            // Remove the event listeners; no longer need them after being called once
            this.removeEventListener('focus', loadGrcOnInteraction);
            this.removeEventListener('input', loadGrcOnInteraction);
            this.removeEventListener('change', loadGrcOnInteraction);

            // Avoid loading recaptcha more than once globally per page
            if (window.grcLoaded) { return; }
            window.grcLoaded = true;

            // Inject recaptcha into the page head
            var head = document.getElementsByTagName('head')[0]
            var script = document.createElement('script')
            script.src = 'https://www.google.com/recaptcha/api.js?hl=[[++cultureKey]]'
            head.appendChild(script)
        }

        // Listen to a few different events. Focus would be ideal, but that doesn't trigger on custom selects. input/change are fallbacks.
        availableInputs.forEach(function (input) {
            input.addEventListener('focus', loadGrcOnInteraction);
            input.addEventListener('input', loadGrcOnInteraction);
            input.addEventListener('change', loadGrcOnInteraction);
        });
    });
</script>