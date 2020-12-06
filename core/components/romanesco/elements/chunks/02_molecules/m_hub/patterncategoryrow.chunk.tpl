<div class="ui segment">
    [[$toolbarPattern?
        &pattern_name=`[[+name]][[+templatename]]`
        &pattern_status=`[[getElementDescription? &type=`[[+elementType]]` &name=`[[+name:empty=`[[+templatename]]`]]` &property=`elementStatus`]]`
    ]]

    [[$dividerBasic]]

    [[+description:prepend=`<p class="meta">`:append=`</p>`]]

    <div class="ui stackable doubling equal width grid">
        [[+elementType:isnot=`ElectronTV`:and:isnot=`Computation`:then=`
        <div id="preview-[[+name:lcase:empty=`[[+templatename:stripAsAlias]]`]]" class="six wide column preview element">
            [[getElementDescription:empty=`[[%romanesco.patterns.preview_not_available]]`?
                &type=`[[+elementType]]`
                &name=`[[+name]][[+templatename]]`
                &property=`elementPreview`
            ]]
        </div>
        `]]

        <div id="code-[[+name:lcase:empty=`[[+templatename:stripAsAlias]]`]]" class="column hidden code element">
            [[+elementType:is=`Template`:then=`
            <pre class="language-html"><code>[[$displayRawTemplate? &uid=`[[+templatename]]`]]</code></pre>
            `]]
            [[+elementType:is=`Computation`:then=`
            <pre class="language-php"><code>[[$displayRawPlugin? &uid=`[[+name]]`]]</code></pre>
            `]]
            [[+elementType:is=`Formula`:then=`
            <pre class="language-php"><code>[[$displayRawElement? &uid=`[[+name]]`]]</code></pre>
            `]]
            [[+elementType:in=`Atom,Molecule,Organism`:then=`
            <pre class="language-html"><code>[[$displayRawElement? &uid=`[[+name]]`]]</code></pre>
            `]]
            [[+elementType:is=`ElectronTV`:then=`
            [[jsonToHTML? &json=`[[tvToJSON? &tv=`[[+name]]` &showName=`1` &showSource=`0` &optionsDelimiter=`0`]]`]]
            `]]
        </div>
    </div>

</div>
