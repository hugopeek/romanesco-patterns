[[includedPatternsLink:toPlaceholder=`link_[[+unique_idx]]`? &input=`[[+category]]`]]
[[+templatename:empty=`[[+name]]`:toPlaceholder=`name`]]

[[If?
    &subject=`[[+link_[[+unique_idx]]]]`
    &operator=`notempty`
    &then=`
        <a class="item" href="[[+link_[[+unique_idx]]]]#[[+name:lcase]]">
            <span class="ui circular label">[[+link_[[+unique_idx]]:setPatternType]]</span>
            [[+name]]
        </a>
    `
    &else=`
        <div class="disabled item">
            <i class="small circular modx icon"></i>
            [[+name]]
        </div>
    `
]]