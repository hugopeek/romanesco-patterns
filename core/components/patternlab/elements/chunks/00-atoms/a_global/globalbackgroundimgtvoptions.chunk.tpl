--- Select a background ---==0||
[[getImageList?
    &docid=`[[++patternlab.global_backgrounds_id]]`
    &tvname=`global_background_img`
    &tpl=`@CODE: [[+background_title]]==[[+background_title:stripAsAlias]] [[If? &subject=`[[+background_inverted]]` &operator=`EQ` &operand=`1` &then=`inverted`]] background`
    &outputSeparator=`||`
]]