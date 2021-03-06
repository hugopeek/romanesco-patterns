[[- Split steps into placeholders ]]
[[[[If?
    &subject=`[[+multiple_steps]]`
    &operator=`notempty`
    &then=`splitString? &input=`,[[+multiple_steps]],` &delimiter=`,[[*id]],` &prefix=`section``
]]]]
[[[[If?
    &subject=`[[+section.1]]`
    &operator=`notempty`
    &then=`splitString? &input=`[[+section.1]]` &delimiter=`,` &prefix=`prev_steps``
]]]]
[[[[If?
    &subject=`[[+section.2]]`
    &operator=`notempty`
    &then=`splitString? &input=`[[+section.2]]` &delimiter=`,` &prefix=`next_steps``
]]]]
[[[[If?
    &subject=`[[+multiple_steps]]`
    &operator=`notempty`
    &then=`splitString? &input=`[[+multiple_steps]]` &delimiter=`,` &prefix=`step``
]]]]

[[- Find out which form is used in previous / next steps ]]
[[[[If?
    &subject=`[[+section.1]]`
    &operator=`notempty`
    &then=`pdoResources?
        &parents=`-1`
        &resources=`[[+section.1]]`
        &tpl=`fbGetFormID`
        &showHidden=`1`
        &limit=`0`
        &outputSeparator=`,`
        &toPlaceholder=`prev_forms`
    `
]]]]
[[[[If?
    &subject=`[[+section.2]]`
    &operator=`notempty`
    &then=`pdoResources?
        &parents=`-1`
        &resources=`[[+section.2]]`
        &tpl=`fbGetFormID`
        &showHidden=`1`
        &limit=`0`
        &outputSeparator=`,`
        &toPlaceholder=`next_forms`
    `
]]]]
