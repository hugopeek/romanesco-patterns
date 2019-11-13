[[cbGetFieldContent:toPlaceholder=`backgroundJSON`?
    &field=`100034`
    &resource=`[[+id]]`
    &returnAsJSON=`1`
]]

.background.[[+alias]]:before {
    background:
        [[!jsonToCSS?
            &json=`[[+backgroundJSON]]`
            &tpl=`globalBackgroundRowCSS`
            &key=`crops`
        ]]
        !important
    ;
    [[jsonToCSS?
        &json=`[[+backgroundJSON]]`
        &tpl=`globalBackgroundSettingsCSS`
        &key=`settings`
    ]]

}
.background.[[+alias]]:after {
    background: [[jsonToCSS:default=`transparent`? &json=`[[+backgroundJSON]]` &key=`background_color`]] !important;
}