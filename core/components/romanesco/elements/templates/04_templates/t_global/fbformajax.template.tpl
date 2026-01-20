[[!fbLoadAssets?
    &uploadFile=`[[cbHasField? &field=`[[++formblocks.cb_input_file_multiple_id]]`]]`
    &frontendValidation=`1`
]][[If?
    &subject=`[[*fb_save_form]]`
    &operator=`EQ`
    &operand=`default`
    &then=`[[++formblocks.save_form]]`
    &else=`[[*fb_save_form]]`
    &toPlaceholder=`save_form`
]][[[[+multiple_steps:notempty=`
    !FormItRetriever?
        &placeholderPrefix=``
        &storeLocation=`session`
        &redirectToOnNotFound=`[[+first_step:isnot=`[[+current_id]]`:then=`[[+first_step]]`:else=``]]`
    `
]]]][[!returnFirstHit?
    &1=`[[+redirect_id:empty=``]]` [[- BUG: this CB placeholder is not available here..]]
    &2=`[[+next_step:empty=``]]`
    &3=`[[*fb_redirect_dynamic:empty=``]]`
    &4=`[[*fb_redirect_id:empty=``]]`
    &toPlaceholder=`redirect_to`
]][[!FormIt?
    &preHooks=`
        [[$fbFormPreHooks]]
        fbEmptyHook
    `
    &renderHooks=`[[*fb_renderhooks]]`
    &hooks=`
        [[$fbFormHooks]]
        fbEmptyHook
    `

    [[$fbEmailProperties]]

    &customValidators=`[[$fbCustomValidators]]`
    &validate=`[[$fbFormValidate]]`
    &placeholderPrefix=`fb[[*id]].`

    &validationErrorBulkFormatJson=`1`
    &validationErrorMessage=`{"success":false,"errors":[[+errors]]}`
    &hookErrorJsonOutputPlaceholder=`hook_error_json_response`
    &errTpl=`[[+error]]`

    &successMessage=`{
        "success":true
        ,"message":"[[%formblocks.form.success_message]]"
        ,"redirect":"[[!~[[+redirect_to]]? &scheme=`full`]]"
    }`
    &successMessagePlaceholder=`fb[[*id]].success_message`

]][[!+fb[[*id]].validation_error_message]][[!+hook_error_json_response]][[!+fb[[*id]].success_message]]