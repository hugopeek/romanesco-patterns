<div class="ui segment">
    <div class="ui middle aligned equal width grid">
        <div class="compact column">
            [[+icon_type:is=`custom`:then=`
            <img class="ui mini image" src="assets/components/romanescobackyard/icons/cb/[[+icon]]@2x.png" alt="Icon">
            `:else=`
            <img class="ui mini image" src="assets/components/contentblocks/img/icons/[[+icon]]@2x.png" alt="Icon">
            `]]
        </div>

        <div class="column">
            [[$headingBasic?
                &level=`h3`
                &value=`[[+name]]<span class="ui mini [[%romanesco.patterns.status_[[+pattern_status]]_color]] empty circular label" title="[[%romanesco.patterns.status_[[+pattern_status]]]]"></span>`
                &alignment=`middle aligned`
            ]]
        </div>

        <div class="compact column">
            [[+elementType:is=`BosonField`:then=`
            <i class="muted info circle link icon with visibility toggle and tooltip"
               data-target="#info-[[+name:stripAsAlias]]"
               data-targetState="hidden"
               data-content="[[%romanesco.patterns.preview_tooltip]]"
               data-position="top center"></i>
            `]]
            <i class="muted code link icon with visibility toggle and tooltip"
               data-target="#code-[[+name:stripAsAlias]]"
               data-targetState="hidden"
               data-content="[[%romanesco.patterns.code_tooltip]]"
               data-position="top center"></i>
            <i class="muted random link icon with visibility toggle and tooltip"
               data-target="#connections-[[+name:stripAsAlias]]"
               data-targetState="hidden"
               data-content="[[%romanesco.patterns.connections_tooltip]]"
               data-position="top center"></i>
        </div>
    </div>

    [[$dividerBasic]]

    <div class="meta">
        [[+properties.custom_preview:stripTags=`<p>,<ul>,<li>,<strong>`:empty=`<p>[[+description:empty=`<em>Description not available.</em>`]]</p>`]]
    </div>

    [[$dividerBasic? &divider_hidden=`1`]]

    [[[[+elementType:is=`BosonField`:then=`setPatternPlaceholders? &cbField=`[[+name]]` &prefix=`cf_[[+id]]`]]]]
    [[[[+elementType:is=`BosonLayout`:then=`setPatternPlaceholders? &cbLayout=`[[+name]]` &prefix=`cl_[[+id]]`]]]]

    <div class="ui stackable doubling equal width grid">

        [[+elementType:is=`BosonField`:then=`
        <div id="info-[[+name:stripAsAlias]]" class="five wide column hidden preview element">
            <table class="ui compact basic table">
                <tr>
                    <td class="six wide"><strong>Type:</strong></td>
                    <td>[[+input]]</td>
                </tr>
                [[+input:is=`chunk`:then=`
                <tr>
                    <td class="six wide"><strong>Chunk:</strong></td>
                    <td>
                        [[pdoResources?
                            &class=`modChunk`
                            &sortby=`id`
                            &limit=`1`
                            &where=`{"id:=":"[[+properties.chunk]]"}`
                            &tpl=`rawName`
                        ]]
                    </td>
                </tr>
                `]]
                [[+input:is=`repeater`:then=`
                <tr>
                    <td colspan="2">
                        <span>Repeater rows:</span>
                        [[pdoResources:prepend=``?
                            &class=`[[+element_class]]`
                            &sortby=`sortorder`
                            &sortdir=`ASC`
                            &limit=`0`
                            &where=`{"parent:=":"[[+id]]"}`
                            &tpl=`patternBosonInnerRow`
                        ]]
                    </td>
                </tr>
                `]]
            </table>
        </div>
        `]]

        <div id="code-[[+name:stripAsAlias]]" class="column hidden code element">
            <pre class="language-html"><code>[[$displayRawTemplate? &uid=`[[+name]]`]]</code></pre>
            [[+[[+cf]].wrapper_template:notempty=`<pre class="language-html"><code>[[+[[+cf]].wrapper_template]]</code></pre>`]]
            [[+elementType:is=`BosonLayout`:then=`[[jsonToHTML:nl2br? &json=`[[+[[+cl]].settings_json]]`]]`]]
            [[+elementType:is=`BosonField`:then=`[[jsonToHTML:nl2br? &json=`[[+[[+cf]].settings_json]]`]]`]]
        </div>
    </div>

    <div id="connections-[[+name:stripAsAlias]]" class="hidden connections element">
        <div class="ui divider"></div>

        <div class="ui stackable equal width vertically divided grid">
            <div class="column">
                <h4 class="ui disabled header">Included patterns</h4>
                [[$includedPatternsOuter?
                    &pattern_template=`patternLayout[[+elementType]]`
                    &pattern_name=`[[+name:stripAsAlias]]`
                    &layout_column=`col[[+idx]].1`
                ]]
            </div>
            <div class="column">
                <h4 class="ui disabled header">Referring patterns</h4>
                [[$referringPatternsOuter?
                    &pattern_template=`patternLayout[[+elementType]]`
                    &pattern_name=`[[+name:stripAsAlias]]`
                    &layout_column=`col[[+idx]].2`
                ]]
            </div>
        </div>

    </div>

</div>
