<form id="form-search" action="[[~[[+landing:default=`[[*id]]`]]]]" method="[[+method:default=`get`]]" role="search">
    <div class="ui massive fluid inverted icon input">
        <input type="search" name="[[+searchIndex]]" id="[[+searchIndex]]" value="[[+searchValue]]" placeholder="[[%romanesco.search.field_placeholder]]">
        <input type="hidden" name="id" value="[[+landing:default=`[[*id]]`]]">
        <i class="search icon link"></i>
    </div>
    [[-<input type="submit" name="submit-search" class="ui basic inverted big button" value="[[%romanesco.search.submit]]">]]
</form>