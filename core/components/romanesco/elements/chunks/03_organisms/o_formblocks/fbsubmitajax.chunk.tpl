<script>
    window.addEventListener('DOMContentLoaded', function() {
        $('.ui.form#form-[[*alias]]').submit(function (e) {
            e.preventDefault();

            [[$fbSubmitAjaxJS]]
        });
    });
</script>

[[loadAssets? &component=`toast`]]
[[loadAssets? &component=`loader`]]
[[loadAssets? &component=`dimmer`]]