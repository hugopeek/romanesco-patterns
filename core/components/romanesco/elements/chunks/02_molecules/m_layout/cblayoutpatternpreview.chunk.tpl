<div class="ui nested stackable doubling equal width grid">
    <div class="row">
        <div id="preview-[[+unique_idx]]" class="[[+preview:contains=`field`:then=`ui form`]] [[+sidebar_width]] wide preview column">
            [[+preview]]

            [[-<i class="small circular code link icon with tooltip onclick"
               data-html="[[$codeSnippet:htmlent? &value=`[[+code_field_raw]]` &lang=`html` &label=`[[%romanesco.patterns.example_label]]`]]"
               data-position="right center">
            </i>]]
        </div>

        [[[[modifiedIf?
            &subject=`[[+pattern_template]]`
            &operator=`containsnot`
            &operand=`Electron`
            &then=`+preview_[[+idx]]_[[+unique_idx]]`
        ]]]]

        [[+info]]
    </div>
</div>