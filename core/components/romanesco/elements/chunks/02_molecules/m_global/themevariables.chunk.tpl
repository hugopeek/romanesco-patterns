// Fonts
//--------------------

[[splitString?
    &input=`[[++theme_font_header]]`
    &prefix=`font_header`
]]
[[splitString?
    &input=`[[++theme_font_page]]`
    &prefix=`font_page`
]]

[[++theme_font_fallback:notempty=`@fontFallback: [[++theme_font_fallback]];`]]

[[++theme_font_page:notempty=`
@pageFont: '[[+font_page.1]]', @fontFallback;
@pageFontRequest: [[+font_page.1]]:[[+font_page.2:empty=`700`]]&subset=[[+font_page.3:empty=`latin`]];
`]]

[[++theme_font_header:notempty=`
@headerFont: '[[+font_header.1]]', @fontFallback;
@headerFontRequest: [[+font_header.1]]:[[+font_header.2:empty=`300,700,300italic,700italic`]]&subset=[[+font_header.3:empty=`latin`]];
@googleFontRequest: '@{headerFontRequest}[[+font_page.1:notempty=`|@{pageFontRequest}`]]';
`]]


// Base Sizes
//--------------------

[[++theme_scale_ratio:notempty=`@scaleRatio: [[++theme_scale_ratio]];`]]
[[++theme_font_size:notempty=`@fontSize: [[++theme_font_size]]rem;`]]


// Brand Colors
//--------------------

[[++theme_color_primary:notempty=`@primaryColor: #[[++theme_color_primary]];`]]
[[++theme_color_secondary:notempty=`@secondaryColor: #[[++theme_color_secondary]];`]]

[[++theme_color_primary_light:notempty=`@lightPrimaryColor: #[[++theme_color_primary_light]];`]]
[[++theme_color_secondary_light:notempty=`@lightSecondaryColor: #[[++theme_color_secondary_light]];`]]

[[++theme_page_background:notempty=`@pageBackground: #[[++theme_page_background]];`]]


// Logo
//--------------------

@logoPath: '[[++logo_path]]';
@logoBadgePath: '[[++logo_badge_path]]';

[[[[++logo_path:isnot=`/`:then=`
    getImageDimensions?
        &image=`[[++base_path]][[++logo_path:replace=`/assets==assets`]]`
        &phWidth=`logo_width`
        &phHeight=`logo_height`
    `
]]]]

[[+logo_width:notempty=`@logoWidth: [[+logo_width]];`]]
[[+logo_height:notempty=`@logoHeight: [[+logo_height]];`]]
[[++logo_target_width:notempty=`@logoScaleRatio: [[++logo_target_width]] / @logoWidth;`]]


// Border Radius
//--------------------

[[++theme_border_radius:eq=`0`:then=`
@relativeBorderRadius: 0;
@absoluteBorderRadius: 0;
`]]

[[++theme_border_radius:gt=`0`:then=`
@relativeBorderRadius: @relative[[++theme_border_radius]]px;
@absoluteBorderRadius: @[[++theme_border_radius]]px;
`]]