<div id="search-fullscreen">
    <button type="button" class="close">×</button>
    <form action="[[~[[+landing:default=`[[*id]]`]]]]" method="[[+method:default=`get`]]" role="search">
        <input type="search" name="[[+searchIndex]]" id="[[+searchIndex]]" value="[[+searchValue]]" placeholder="[[%bootquest.form.search_field_placeholder]]" autocomplete="off">
        <input type="hidden" name="id" value="[[+landing:default=[[*id]]]]">
        <input type="submit" name="submit-search" class="btn btn-primary btn-lg" value="[[%bootquest.form.search_button_value]]">
    </form>
</div>