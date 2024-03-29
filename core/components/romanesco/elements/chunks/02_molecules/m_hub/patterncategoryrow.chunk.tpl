[[+name:lcase:empty=`[[+templatename:stripAsAlias]]`:toPlaceholder=`pl[[+id]].pattern_name`]]

<div id="[[+pl[[+id]].pattern_name]]" class="ui pattern segment">
    [[$toolbarPattern?
        &pattern_name=`[[+name]][[+templatename]]`
        &pattern_status=`[[getElementDescription? &type=`[[+elementType]]` &name=`[[+name:empty=`[[+templatename]]`]]` &property=`elementStatus`]]`
    ]]

    [[$dividerBasic]]

    [[+description:prepend=`<p class="meta">`:append=`</p>`]]

    <div class="ui stackable equal width grid">
        [[+elementType:isnot=`ElectronTV`:and:isnot=`Computation`:then=`
        <div id="preview-[[+pl[[+id]].pattern_name]]" class="six wide column preview element">
            [[getElementDescription:empty=`<em class="meta">[[%romanesco.patterns.preview_not_available]].</em>`?
                &type=`[[+elementType:lcase]]`
                &name=`[[+name:empty=`[[+templatename]]`]]`
                &property=`elementPreview`
            ]]
        </div>
        `]]

        <div id="code-[[+pl[[+id]].pattern_name]]" class="column hidden code element">
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

    <div id="connections-[[+pl[[+id]].pattern_name]]" class="hidden connections element">
        [[$dividerBasic]]

        <div class="ui stackable equal width divided grid">
            <div class="row">
                <div class="column">
                    <h4 class="ui disabled header">
                        [[%romanesco.patterns.[[+elementType:is=`ElectronTV`:then=`assigned_templates`:else=`included_patterns`]]]]
                    </h4>
                    [[[[If?
                        &subject=`[[+elementType]]`
                        &operator=`is`
                        &operand=`ElectronTV`
                        &then=`
                            $referringPatternsOuter?
                                &pattern_list=`assignedTemplates`
                                &pattern_template=`patternLayout[[+elementType]]`
                                &pattern_name=`[[+pl[[+id]].pattern_name]]`
                                &prefix=`pl[[+id]]`
                            `
                        &else=`
                            $includedPatternsOuter?
                                &pattern_list=`includedPatterns`
                                &pattern_template=`patternLayout[[+elementType]]`
                                &pattern_name=`[[+pl[[+id]].pattern_name]]`
                                &prefix=`pl[[+id]]`
                            `
                        &uid=`[[+id]]_[[+idx]]`
                    ]]]]
                </div>
                <div class="column">
                    <h4 class="ui disabled header">
                        [[%romanesco.patterns.[[+elementType:is=`Template`:then=`assigned_tvs`:else=`referring_patterns`]]]]
                    </h4>
                    [[[[If?
                        &subject=`[[+elementType]]`
                        &operator=`is`
                        &operand=`Template`
                        &then=`
                            $includedPatternsOuter?
                                &pattern_list=`assignedTVs`
                                &pattern_template=`patternLayout[[+elementType]]`
                                &pattern_name=`[[+pl[[+id]].pattern_name]]`
                                &prefix=`pl[[+id]]`
                            `
                        &else=`
                            $referringPatternsOuter?
                                &pattern_list=`referringPatterns`
                                &pattern_template=`patternLayout[[+elementType]]`
                                &pattern_name=`[[+pl[[+id]].pattern_name]]`
                                &prefix=`pl[[+id]]`
                            `
                        &uid=`[[+id]]_[[+idx]]`
                    ]]]]
                </div>
            </div>
        </div>
    </div>
</div>
