<figure class="ui [[+classes]] content image">
    [[$imgResponsive? &uid=`[[+url]]`]]
    [[If?
        &subject=`[[+credits]][[+caption]]`
        &operator=`notempty`
        &then=`<figcaption>[[+caption]][[+credits:stripTags=`<a>,<em>,<strong>`:prepend=`<span class="credits meta">&copy; `:append=`</span>`]]</figcaption>`
    ]]
</figure>