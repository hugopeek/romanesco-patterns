<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="[[++romanesco.custom_vendor_path]]/jquery/jquery.min.js"><\/script>')</script>
<script src="[[++romanesco.semantic_dist_path]]/semantic.min.js"></script>
<script src="[[++romanesco.custom_vendor_path]]/onmediaquery/onmediaquery.min.js"></script>
<script src="[[++romanesco.custom_vendor_path]]/vanilla-lazyload/lazyload.min.js"></script>
[[[[cbHasFields?
    &field=`84`
    &then=`sliderLoadAssets`
]]]]
[[+load_assets_hub:eq=`1`:then=`
<script src="[[++romanesco.semantic_dist_path]]/components/modal.js"></script>
<script src="[[++romanesco.custom_vendor_path]]/tablesort/tablesort.min.js"></script>
<script src="[[++romanesco.custom_js_path]]/hub.js"></script>
`]]
[[+load_syntax_highlighting:eq=`1`:then=`
<script src="[[++romanesco.custom_vendor_path]]/prism/prism.min.js"></script>
`]]
[[[[*comments_toggle:eq=`1`:then=`$commentScript[[++comment_platform]]`]]]]
<script src="[[++romanesco.custom_js_path]]/site.js"></script>
[[++footer_additional]]
