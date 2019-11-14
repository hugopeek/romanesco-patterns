[[cbGetFieldContent:toPlaceholder=`backgroundJSON`?
    &field=`[[++romanesco.cb_field_background_id]]`
    &resource=`[[+id]]`
    &returnAsJSON=`1`
]]

.background.[[+alias]]:before {
    background:
        [[jsonGetObject?
            &json=`[[+backgroundJSON]]`
            &tpl=`globalBackgroundRowCSS`
            &object=`rows`
            &outputSeparator=`,`
        ]]
        !important
    ;
    [[jsonGetObject?
        &json=`[[+backgroundJSON]]`
        &tpl=`globalBackgroundSettingsCSS`
        &object=`settings`
    ]]

}
.background.[[+alias]]:after {
    background: [[jsonGetObject:default=`transparent`? &json=`[[+backgroundJSON]]` &object=`background_color`]] !important;
}