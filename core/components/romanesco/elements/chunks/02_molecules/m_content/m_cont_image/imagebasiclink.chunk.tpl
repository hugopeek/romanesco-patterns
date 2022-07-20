<a href="[[+link]]" class="ui [[+classes]] content image" [[+attributes]]>
    [[$imgResponsive? &uid=`[[+url]]`]]
    [[If?
        &subject=`[[+credits]][[+caption]]`
        &operator=`notempty`
        &then=`<div class="caption">[[+caption]][[+credits:stripTags=`<em>,<strong>`:prepend=`<span class="credits meta">&copy; `:append=`</span>`]]</div>`
    ]]
</a>