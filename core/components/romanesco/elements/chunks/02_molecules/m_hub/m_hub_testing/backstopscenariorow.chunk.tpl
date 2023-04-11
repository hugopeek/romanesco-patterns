{
    "label": "[[+pagetitle]] ([[+id]])",
    "url": "[[~[[+id]]? &scheme=`full`]]",
    [[*backstop_reference_url:notempty=`
    "referenceUrl": "[[*backstop_reference_url]][[+uri]]",
    `]]
    "delay": [[*backstop_delay]],
    "hideSelectors": [[*backstop_hide_selectors:empty=`[]`]],
    "removeSelectors": [[*backstop_remove_selectors:empty=`[]`]],
    "hoverSelectors": [[*backstop_hover_selectors:empty=`[]`]],
    "clickSelectors": [[*backstop_click_selectors:empty=`[]`]],
    "keyPressSelectors": [[*backstop_keypress_selectors:empty=`[]`]],
    "postInteractionWait": [[*backstop_post_interaction_wait]],
    "selectors": [[*backstop_selectors:empty=`[]`]],
    "selectorExpansion": [[*backstop_selector_expansion]],
    "expect": [[*backstop_selector_expect]],
    "misMatchThreshold": [[*backstop_mismatch_threshold]],
    "requireSameDimensions": true
}