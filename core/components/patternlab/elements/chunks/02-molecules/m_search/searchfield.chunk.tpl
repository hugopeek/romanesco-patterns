<form id="search-field" action="[[~[[+landing:default=`[[*id]]`]]]]" method="[[+method:default=`get`]]" role="search">
    <div class="small fluid ui icon input">
        <input type="search" name="[[+searchIndex]]" id="[[+searchIndex]]" value="[[+searchValue]]" placeholder="[[%patternlab.search.field_placeholder]]">
        <input type="hidden" name="id" value="[[+landing:default=[[*id]]]]">
        <i class="search icon link"></i>
    </div>
</form>