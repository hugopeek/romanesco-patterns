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
        [[pdoResources?
            &parents=`0`
            &resources=`[[*content]]`
            &limit=`0`
            &tpl=`@INLINE
            {
                "label": "[[+pagetitle]] ([[+id]])",
                "url": "[[~[[+id]]? &scheme=`full`]]",
                [[*reference_url:notempty=`
                "referenceUrl": "[[*reference_url]][[+uri]]",
                `]]
                "delay": 2000,
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
                "misMatchThreshold" : 3,
                "requireSameDimensions": true
            }`
            &outputSeparator=`,`
        ]]
    ],
    "paths": {
        "bitmaps_reference": "_backstop/[[+backstop_id]]/bitmaps_reference",
        "bitmaps_test": "_backstop/[[+backstop_id]]/bitmaps_test",
        "engine_scripts": "tests",
        "html_report": "_backstop/[[+backstop_id]]/html_report",
        "ci_report": "_backstop/[[+backstop_id]]/ci_report"
    },
    "onReadyScript": "backstop-ready.js",
    "report": ["browser"],
    "engine": "puppeteer",
    "engineOptions": {
        "args": ["--no-sandbox"]
    },
    "puppeteerOffscreenCaptureFix": false,
    "asyncCaptureLimit": 3,
    "asyncCompareLimit": 30,
    "debug": false,
    "debugWindow": false
}