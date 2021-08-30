[[includedPatternsLink:toPlaceholder=`pl_[[+id]]_[[+idx]].link`?
    &input=`[[+category]]`
    &pattern=`[[+name]]`
    &prefix=`pl_[[+id]]_[[+idx]]`
]]

[[If?
    &subject=`[[+pl_[[+id]]_[[+idx]].link]]`
    &operator=`notempty`
    &then=`
        <a class="item" href="[[+pl_[[+id]]_[[+idx]].link]]">
            <span class="ui circular label">[[+pl_[[+id]]_[[+idx]].link:setPatternType]]</span>
            [[+name]]
            [[+assigned:eq=`1`:then=`<span class="ui right floated tiny blue label">Assigned</span>`]]
        </a>
    `
    &else=`
        <div class="disabled item">
            <i class="small circular modx icon"></i>
            [[+name]]
        </div>
    `
    &uid=`[[+id]]_[[+idx]]`
]]