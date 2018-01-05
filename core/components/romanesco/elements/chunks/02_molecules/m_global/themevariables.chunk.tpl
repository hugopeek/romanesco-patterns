// Fonts
//--------------------

[[++theme_font_name:notempty=`@fontName: '[[++theme_font_name]]';`]]
[[++theme_font_fallback:notempty=`@fontFallback: [[++theme_font_fallback]];`]]

[[++theme_font_weights:notempty=`@googleFontSizes: '[[++theme_font_weights]]';`]]
[[++theme_font_subset:notempty=`@googleSubset: '[[++theme_font_subset]]';`]]


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

[[++logo_path:isnot=`/`:then=`@logoPath: '[[++logo_path]]';`]]
[[++logo_badge_path:isnot=`/`:then=`@logoBadgePath: '[[++logo_badge_path]]';`]]

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

[[++theme_border_radius:notempty=`@relativeBorderRadius: @relative[[++theme_border_radius]]px;`]]
[[++theme_border_radius:notempty=`@absoluteBorderRadius: @[[++theme_border_radius]]px;`]]