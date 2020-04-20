<?php
/**
 * getYoutubeThumb
 *
 * Retrieve the largest existing thumbnail image available. You can choose
 * between JPG and webP extension. Can be used as output modifier as well.
 */

$videoID = $modx->getOption('videoID', $scriptProperties, $input);
$imgType = $modx->getOption('imgType', $scriptProperties, $options);

if (!$imgType) $imgType = 'jpg';
$vi = ($imgType == 'webp') ? 'vi_webp' : 'vi';
$imgURL = "https://img.youtube.com/$vi/$videoID/0.$imgType";

$resolutions = array('maxresdefault', 'hqdefault', 'mqdefault');

foreach($resolutions as $res) {
    $imgUrl = "https://img.youtube.com/$vi/$videoID/$res.$imgType";
    if(@getimagesize(($imgUrl))) {
        return $imgUrl;
    }
}

return $imgUrl;