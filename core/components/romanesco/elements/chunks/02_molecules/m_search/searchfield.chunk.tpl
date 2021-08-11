<form id="form-search" action="[[~[[+landing:default=`[[*id]]`]]]]" method="[[+method:default=`get`]]" role="search">
    <div class="ui [[+search_field_classes:default=`tiny fluid`]] icon input">
        <input type="search" name="[[+searchIndex]]" id="[[+searchIndex]]" value="[[+searchValue]]" placeholder="[[%romanesco.search.field_placeholder]]">
        <input type="hidden" name="id" value="[[+landing:default=`[[*id]]`]]">
        <i class="search icon link"></i>
    </div>
</form>