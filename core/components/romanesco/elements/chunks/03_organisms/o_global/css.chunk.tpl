/*******************************
    CUSTOM CSS

    Global additions to Semantic UI styles, based on site content and settings.
    This mostly contains the Global Backgrounds.

    NB: DO NOT EDIT DIRECTLY!

    Generated by MODX when saving the Global Backgrounds. If you want to add
    styling manually, create a globalBackgroundsTheme chunk or add them
    somewhere in your Semantic UI theme (or site folder).

*******************************/

@import url("/[[++romanesco.semantic_css_path]]/backgrounds[[++minify_css_js:eq=`1`:then=`.min`]].css");


/* Load all backgrounds set under Global Content */

[[- DEPRECATED MIGX TV BACKGROUNDS ]]
[[-getImageList?
    &docid=`[[++romanesco.global_backgrounds_id]]`
    &tvname=`global_background_img`
    &tpl=`globalBackgroundImgCSS`
]]

[[pdoResources?
    &parents=`[[++romanesco.global_backgrounds_id]]`
    &limit=`0`
    &depth=`0`
    &showUnpublished=`1`
    &tpl=`globalBackgroundCSS`
    &where=`{"template:=":"27"}`
    &tvPrefix=``
]]

/* Load additional backgrounds for given context */

[[pdoResources?
    &parents=`[[++romanesco.global_backgrounds_id]]`
    &limit=`0`
    &showUnpublished=`1`
    &tpl=`globalBackgroundCSS`
    &where=`[{"template:=":"27"},{"uri:LIKE":"%/[[+context]]/%"}]`
    &tvPrefix=``
]]


/* Load all backgrounds based on an overview image */

[[pdoResources?
    [[+context:notempty=`&context=`[[+context]]``]]
    &parents=`0`
    &limit=`0`
    &showUnpublished=`1`
    &tpl=`globalBackgroundImgOverviewCSS`
    &includeTVs=`overview_img_pano,overview_img_wide`
    &processTVs=`1`
    &tvFilters=`header_background_img!==`
    &tvPrefix=``
]]


/* Additional styles */

[[[[modifiedIf?
    &subject=`globalBackgroundsTheme`
    &operator=`iselement`
    &operand=`chunk`
    &then=`$globalBackgroundsTheme? &context=`[[+context:empty=`web`]]``
    &else=``
]]]]