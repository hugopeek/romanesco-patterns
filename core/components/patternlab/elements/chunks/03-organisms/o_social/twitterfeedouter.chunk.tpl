<div class="[[+cols:ne=`1`:then=`ui [[+cols]] stackable cards`:else=``]]">
    [[!TwitterX?
        &twitter_consumer_key=`[[++twitter_consumer_key:empty=`[[++patternlab.twitter_consumer_key]]`]]`
        &twitter_consumer_secret=`[[++twitter_consumer_secret:empty=`[[++patternlab.twitter_consumer_secret]]`]]`
        &twitter_access_token=`[[++twitter_access_token:empty=`[[++patternlab.twitter_access_token]]`]]`
        &twitter_access_token_secret=`[[++twitter_access_token_secret:empty=`[[++patternlab.twitter_access_token_secret]]`]]`
        &limit=`[[+limit]]`
        &timeline=`[[+timeline_type]]`
        &chunk=`[[+template]]`
        &cache=`7200`
        &screen_name=`[[+username:empty=`[[++social_twitter:empty=`[[++patternlab.social_twitter]]`]]`]]`
        &include_rts=`[[+retweets]]`
    ]]
</div>