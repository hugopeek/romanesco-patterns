[[+templatename:empty=`[[+name]]`:toPlaceholder=`name`]]

[[includedPatternsLink?
    &input=`[[+category]]`
    &prefix=`pl_[[+idx]]_[[+unique_idx]]`
    &toPlaceholder=`link`
]]

[[If?
    &subject=`[[+[[+pl]].link]]`
    &operator=`notempty`
    &then=`
        <a class="item" href="[[+[[+pl]].link]]#[[+name:lcase]]">
            <span class="ui circular label">[[+[[+pl]].link:setPatternType]]</span>
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