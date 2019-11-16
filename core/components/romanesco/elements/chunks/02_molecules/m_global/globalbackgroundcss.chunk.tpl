[[cbGetFieldContent:toPlaceholder=`backgroundJSON`?
    &field=`[[++romanesco.cb_field_background_id]]`
    &resource=`[[+id]]`
    &returnAsJSON=`1`
]]

.background.[[+alias]]:before {
    background:
        [[jsonGetObject?
            &json=`[[+backgroundJSON]]`
            &tpl=`globalBackgroundRowCSS@MobilePortraitRegular`
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

@media
    (min-width: 500px) {
    .background.[[+alias]]:before {
        background:
            [[jsonGetObject?
                &json=`[[+backgroundJSON]]`
                &tpl=`globalBackgroundRowCSS@MobileLandscapeRegular`
                &object=`rows`
                &outputSeparator=`,`
            ]]
            !important
        ;
    }
}
@media
    (min-width: 800px) {
    .background.[[+alias]]:before {
        background:
            [[jsonGetObject?
                &json=`[[+backgroundJSON]]`
                &tpl=`globalBackgroundRowCSS@TabletRegular`
                &object=`rows`
                &outputSeparator=`,`
            ]]
            !important
        ;
    }
}
@media
    (min-width: 1300px) {
    .background.[[+alias]]:before {
        background:
            [[jsonGetObject?
                &json=`[[+backgroundJSON]]`
                &tpl=`globalBackgroundRowCSS@DesktopRegular`
                &object=`rows`
                &outputSeparator=`,`
            ]]
            !important
        ;
    }
}

[[++img_hidpi:eq=`1`:then=`
@media
    (-webkit-min-device-pixel-ratio: 2),
    (min-resolution: 192dpi) {
    .background.[[+alias]]:before {
        background:
            [[jsonGetObject?
                &json=`[[+backgroundJSON]]`
                &tpl=`globalBackgroundRowCSS@MobileHiDPI`
                &object=`rows`
                &outputSeparator=`,`
            ]]
            !important
        ;
    }
}
@media
    (-webkit-min-device-pixel-ratio: 2) and (min-width: 500px),
    (min-resolution: 192dpi) and (min-width: 500px) {
    .background.[[+alias]]:before {
        background:
            [[jsonGetObject?
                &json=`[[+backgroundJSON]]`
                &tpl=`globalBackgroundRowCSS@TabletHiDPI`
                &object=`rows`
                &outputSeparator=`,`
            ]]
            !important
        ;
    }
}
@media
    (-webkit-min-device-pixel-ratio: 2) and (min-width: 1300px),
    (min-resolution: 192dpi) and (min-width: 1300px) {
    .background.[[+alias]]:before {
        background:
            [[jsonGetObject?
                &json=`[[+backgroundJSON]]`
                &tpl=`globalBackgroundRowCSS@DesktopHiDPI`
                &object=`rows`
                &outputSeparator=`,`
            ]]
            !important
        ;
    }
}
`]]