<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="[[++romanesco.custom_vendor_path]]/jquery/jquery.min.js"><\/script>')</script>
<script src="[[++romanesco.semantic_dist_path]]/semantic.min.js"></script>
<script src="[[++romanesco.custom_vendor_path]]/onmediaquery/onmediaquery.min.js"></script>
<script src="[[++romanesco.custom_js_path]]/tablesort.js"></script>
[[cbHasFields?
    &field=`[[++romanesco.cb_field_code_id]]`
    &then=`<script src="[[++romanesco.custom_vendor_path]]/prism/prism.min.js"></script>`
]]
[[cbHasFields?
    &field=`84`
    &then=`[[sliderLoadAssets]]`
]]
<script src="[[++romanesco.custom_js_path]]/site.js"></script>