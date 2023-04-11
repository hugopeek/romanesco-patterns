[[*alias:replace=`-==_`:toPlaceholder=`backstop_id`]]
{
    "id": "[[+backstop_id]]",
    "viewports": [[*backstop_viewports]],
    "scenarios": [
        [[!pdoResources?
            &parents=`0`
            &resources=`[[*content]]`
            &limit=`0`
            &showUnpublished=`0`
            &tpl=`[[*backstop_scenario_tpl]]`
            &outputSeparator=`,`
        ]]
    ],
    "paths": {
        "bitmaps_reference": "_backstop/[[+backstop_id]]/bitmaps_reference",
        "bitmaps_test": "_backstop/[[+backstop_id]]/bitmaps_test",
        "engine_scripts": "_operations/test/engine_scripts",
        "html_report": "_backstop/[[+backstop_id]]/html_report",
        "json_report": "_backstop/[[+backstop_id]]/json_report",
        "ci_report": "_backstop/[[+backstop_id]]/ci_report"
    },
    "onBeforeScript": "[[*backstop_engine]]/onBefore.js",
    "onReadyScript": "[[*backstop_engine]]/onReady.js",
    "report": [
        [[*backstop_report]]
    ],
    "engine": "[[*backstop_engine]]",
    "engineOptions": {
        "browser": "[[*backstop_engine_browser]]",
        "args": ["--no-sandbox"]
    },
    "puppeteerOffscreenCaptureFix": false,
    "asyncCaptureLimit": [[*backstop_async_capture_limit]],
    "asyncCompareLimit": [[*backstop_async_compare_limit]],
    "debug": false,
    "debugWindow": false
}