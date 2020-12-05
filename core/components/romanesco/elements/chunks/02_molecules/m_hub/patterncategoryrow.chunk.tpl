<div class="ui segment">
    [[$toolbarPattern?
        &pattern_name=`[[+name]]`
        &pattern_status=`[[getElementDescription? &type=`Atom` &name=`[[+name]]` &property=`elementStatus`]]`
    ]]

    [[+description:prepend=`<p class="meta">`:append=`</p>`]]

    <div class="ui stackable doubling equal width grid">
        <div class="row">
            <div id="preview-[[+name:lcase]]" class="six wide column preview element">
                [[getElementDescription:empty=`[[%romanesco.patterns.preview_not_available]]`?
                    &type=`Atom`
                    &name=`[[+name]]`
                    &property=`elementPreview`
                ]]
            </div>

            <div id="code-[[+name:lcase]]" class="column hidden code element">
                <pre class="language-html"><code>[[$displayRawElement? &uid=`[[+name]]`]]</code></pre>
            </div>
        </div>
    </div>

</div>
