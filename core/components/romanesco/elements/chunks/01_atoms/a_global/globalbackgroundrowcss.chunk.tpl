[[If:toPlaceholder=`img_uncropped`?
    &subject=`[[+image.crops.mobile.url:empty=``]][[+image.crops.tablet.url:empty=``]][[+image.crops.desktop.url:empty=``]]`
    &operand=`empty`
    &then=`
    [[pthumb:prepend=`url(`:append=`)`?
        &input=`[[+image.url]]`
        &options=`w=[[+imgWidth]]
            &q=[[++img_quality]]
            &scale=[[+imgScale:default=`1`]]
        `
    ]]`
    &else=``
]]
[[If:empty=`[[+gradient]]`?
    &subject=`[[+image.extension]]`
    &operator=`is`
    &operand=`svg`
    &then=`[[+image.url:prepend=`url(/`:append=`)`]]`
    &else=`
    [[If?
        &subject=`[[+image.crops.[[+imgType]].url]]`
        &operator=`notempty`
        &then=`
        [[pthumb:prepend=`url(`:append=`)`?
            &input=`[[+image.url]]`
            &options=`w=[[+imgWidth]]
                &sx=[[+image.crops.[[+imgType]].x]]
                &sy=[[+image.crops.[[+imgType]].y]]
                &sw=[[+image.crops.[[+imgType]].width]]
                &sh=[[+image.crops.[[+imgType]].height]]
                &q=[[++img_quality]]
                &scale=[[+imgScale:default=`1`]]
            `
        ]]`
        &else=`[[+img_uncropped]]`
    ]]`
]]
[[+position:empty=`center center`]] /
[[+size:empty=`cover`]]
[[+repeat]]
[[+attachment]]