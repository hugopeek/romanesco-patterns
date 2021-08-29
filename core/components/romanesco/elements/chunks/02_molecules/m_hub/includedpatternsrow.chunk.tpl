[[modifiedIf?
    &subject=`[[+pattern_name]]`
    &operator=`is`
    &operand=`[[+templatename:lcase]]`
    &then=`[[+name]]`
    &else=`[[+templatename:empty=`[[+name]]`]]`
    &toPlaceholder=`[[+id]]_[[+idx]].name`
]]

[[includedPatternsLink?
    &input=`[[+category]]`
    &prefix=`[[+id]]_[[+idx]]`
    &toPlaceholder=`link`
]]

[[If?
    &subject=`[[+[[+pl]].link]]`
    &operator=`notempty`
    &then=`
        <a class="item" href="[[+[[+pl]].link]]#[[+[[+id]]_[[+idx]].name:lcase]]">
            <span class="ui circular label">[[+[[+pl]].link:setPatternType]]</span>
            [[+[[+id]]_[[+idx]].name]]
            [[+assigned:eq=`1`:then=`<span class="ui right floated tiny blue label">Assigned</span>`]]
        </a>
    `
    &else=`
        <div class="disabled item">
            <i class="small circular modx icon"></i>
            [[+[[+id]]_[[+idx]].name]]
        </div>
    `
    &uid=`[[+id]]_[[+idx]]`
]]