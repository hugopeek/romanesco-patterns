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
            <i class="muted info circle link icon with visibility toggle and tooltip"
               data-target="#info-[[+name:stripAsAlias]]"
               data-targetState="hidden"
               data-content="[[%romanesco.patterns.preview_tooltip]]"
               data-position="top center"></i>
            <i class="muted code link icon with visibility toggle and tooltip"
               data-target="#code-[[+name:stripAsAlias]]"
               data-targetState="hidden"
               data-content="[[%romanesco.patterns.code_tooltip]]"
               data-position="top center"></i>
            <i class="muted random link icon with tooltip"
               data-content="[[%romanesco.patterns.connections_tooltip]]"
               data-position="top center"></i>
        </div>
    </div>

    [[$dividerBasic]]

    <div class="meta">
        [[+properties.custom_preview:stripTags=`<p>,<ul>,<li>,<strong>`:empty=`<p>[[+description:empty=`<em>Description not available.</em>`]]</p>`]]
    </div>

    [[$dividerBasic? &divider_hidden=`1`]]

    [[setPatternPlaceholders? &cbField=`[[+name]]` &prefix=`cf_[[+name:stripAsAlias]]`]]

    <div class="ui stackable doubling equal width grid">
        <div id="info-[[+name:stripAsAlias]]" class="five wide column hidden preview element">
            <table class="ui compact basic table">
                <tr>
                    <td class="six wide">Type:</td>
                    <td>[[+input]]</td>
                </tr>
                [[+input:is=`chunk`:then=`
                <tr>
                    <td class="six wide">Chunk:</td>
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

        <div id="code-[[+name:stripAsAlias]]" class="column hidden code element">
            [[jsonToHTML:nl2br? &json=`[[+[[+cf]].settings_json]]`]]
        </div>
    </div>

</div>
