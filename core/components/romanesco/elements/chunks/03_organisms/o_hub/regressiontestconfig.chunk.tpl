[[*alias:replace=`-==_`:toPlaceholder=`backstop_id`]]
{
    "id": "[[+backstop_id]]",
    "viewports": [
        {
            "label": "phone",
            "width": 320,
            "height": 480
        },{
            "label": "tablet",
            "width": 800,
            "height": 600
        },{
            "label": "desktop",
            "width": 1440,
            "height": 960
        }
    ],
    "scenarios": [
        [[getSelections?
            [[+selection_id:notempty=`&selections=`[[+selection_id]]``]]
            &tpl=`@INLINE [[- Important! Keep the space on the left here..]]
            {
                "label": "[[+pagetitle]] ([[+id]])",
                "url": "[[++site_url]][[+uri]]",
                "referenceUrl": "[[+reference_url:empty=`[[++romanesco.backstop_reference_url]]`]][[+uri]]",
                "delay": 1,
                "hideSelectors": [
                    ".publication .meta",
                    ".ui.active.embed"
                ],
                "removeSelectors": [
                    "#menu .item.highlight .basic.button",
                    "#author-about",
                    "#disqus_thread",
                    ".g-recaptcha"
                ],
                "hoverSelector": "",
                "clickSelector": "",
                "postInteractionWait": 1,
                "selectors": [],
                "selectorExpansion": true,
                "expect": 0,
                "misMatchThreshold" : 0.1,
                "requireSameDimensions": true
            }`
            &outputSeparator=`,`
        ]]
    ],
    "paths": {
        "bitmaps_reference": "_backstop/[[+backstop_id]]/bitmaps_reference",
        "bitmaps_test": "_backstop/[[+backstop_id]]/bitmaps_test",
        "engine_scripts": "_backstop/[[+backstop_id]]/engine_scripts",
        "html_report": "_backstop/[[+backstop_id]]/html_report",
        "ci_report": "_backstop/[[+backstop_id]]/ci_report"
    },
    "report": ["browser"],
    "engine": "puppeteer",
    "engineOptions": {
        "args": ["--no-sandbox"]
    },
    "asyncCaptureLimit": 3,
    "asyncCompareLimit": 30,
    "debug": false,
    "debugWindow": false
}