[[Rowboat:toPlaceholder=`raw_chunk`?
    &table=`modx_site_htmlsnippets`
    &tpl=`displayRawElement`
    &where=`{"name":"[[+pattern_name]]"}`
]]

[[[[If?
    &subject=`[[+raw_chunk]]`
    &operator=`empty`
    &then=`
        Rowboat:toPlaceholder=`raw_template`?
            &table=`modx_site_templates`
            &tpl=`displayRawTemplate`
            &where=`{"templatename":"[[+pattern_name]]"}`
        `
]]]]

<div class="ui list">
    [[includedSnippets? &input=`[[+raw_chunk:empty=`[[+raw_template]]`]]`]]
</div>