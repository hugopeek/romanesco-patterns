<div class="ui container">
    <div class="ui large feed">
        [[migxLoopCollection?
            &packageName=`romanescobackyard`
            &classname=`FractalFarming\Romanesco\Model\rmTask`
            &tpl=`projectHubRow`
            &where=`{"resource_id":"[[++romanesco.dashboard_id:empty=`[[*id]]`]]","type":"project-hub","deleted":"0"}`
            &sortConfig=`[{"sortby":"date","sortdir":"DESC"}]`
        ]]
        <div class="event">
            <div class="label">
                <i class="lab icon"></i>
            </div>
        </div>
    </div>
</div>
[[loadAssets? &component=`feed`]]