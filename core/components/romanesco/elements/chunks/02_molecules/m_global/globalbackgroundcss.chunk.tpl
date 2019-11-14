[[cbGetFieldContent:toPlaceholder=`backgroundJSON`?
    &field=`100034`
    &resource=`[[+id]]`
    &returnAsJSON=`1`
]]

.background.[[+alias]]:before {
    background:
        [[!jsonGetObject?
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