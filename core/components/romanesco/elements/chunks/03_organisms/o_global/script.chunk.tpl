<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="[[++romanesco.semantic_vendor_path]]/jquery/jquery.min[[+cache_buster_js]].js"><\/script>')</script>
<script src="[[++romanesco.semantic_dist_path]]/semantic[[+minify]][[+cache_buster_js]].js"></script>
<script src="[[++romanesco.semantic_vendor_path]]/onmediaquery/onmediaquery.min[[+cache_buster_js]].js"></script>
<script src="[[++romanesco.semantic_vendor_path]]/vanilla-lazyload/lazyload.min[[+cache_buster_js]].js"></script>
<script src="[[++romanesco.semantic_vendor_path]]/scrolldir/scrolldir.auto.min[[+cache_buster_js]].js"></script>
[[[[cbHasFields?
    &field=`84`
    &then=`sliderLoadAssets`
]]]]
[[+load_assets_hub:eq=`1`:then=`
<script src="[[++romanesco.semantic_dist_path]]/components/modal[[+minify]][[+cache_buster_js]].js"></script>
<script src="[[++romanesco.semantic_vendor_path]]/tablesort/tablesort.min[[+cache_buster_js]].js"></script>
<script src="[[++romanesco.semantic_js_path]]/hub[[+minify]][[+cache_buster_js]].js"></script>
`]]
[[+load_syntax_highlighting:eq=`1`:then=`
<script src="[[++romanesco.semantic_vendor_path]]/prism/prism.min[[+cache_buster_js]].js"></script>
`]]
[[[[*comments_toggle:eq=`1`:then=`$commentScript[[++comment_platform]]`]]]]
<script src="[[++romanesco.semantic_js_path]]/site[[+minify]][[+cache_buster_js]].js"></script>
[[++footer_additional]]
