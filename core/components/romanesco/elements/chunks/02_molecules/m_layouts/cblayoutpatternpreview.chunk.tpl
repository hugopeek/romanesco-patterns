<div class="ui nested stackable doubling equal width grid">
    <div class="row">
        <div id="preview-[[+unique_idx]]" class="[[+preview:contains=`field`:then=`ui form`]] [[+sidebar_width]] wide preview column">
            [[+preview]]

            [[+code_field_raw:contains=`[[+pattern_name]]`:then=`
            <i class="small circular code link icon with popup onclick"
               data-html="[[$codeSnippet:htmlent? &value=`[[+code_field_raw]]` &lang=`html` &label=`[[%romanesco.patterns.example_label]]`]]"
               data-position="right center"></i>
            `]]

            [[-+example:ne=``:then=`
            <div class="slider-minimal">
                <div id="preview-example-[[+unique_idx]]">
                    [[+example]]
                </div>
                <div id="preview-code-[[+unique_idx]]">
                    [[+preview]]
                </div>
            </div>
            `:else=`[[+preview]]`]]
        </div>

        <div id="code-[[+unique_idx]]" class="code column hidden element">
            [[+code]]
        </div>
    </div>
</div>