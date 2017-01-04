[[+templatename:empty=`[[+name]]`:toPlaceholder=`name`]]

[[includedPatternsLink?
    &input=`[[+category]]`
    &prefix=`pl_[[+unique_idx]]_[[+idx]]`
    &toPlaceholder=`link`
]]

[[If?
    &subject=`[[+[[+prefix]].link]]`
    &operator=`notempty`
    &then=`
        <a class="item" href="[[+[[+prefix]].link]]#[[+name:lcase]]">
            <span class="ui circular label">[[+[[+prefix]].link:setPatternType]]</span>
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