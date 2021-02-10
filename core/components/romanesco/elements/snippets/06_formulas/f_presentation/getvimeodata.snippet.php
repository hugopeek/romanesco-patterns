<?php
/**
 * getVimeoData
 *
 * Retrieve thumbnail and video ID through oEmbed. Outputs them as placeholder.
 *
 * You need to make this request because video ID and thumbnail ID are not
 * always the same, depending on the Vimeo privacy settings.
 */

$videoURL = $modx->getOption('videoURL', $scriptProperties, $input);
$prefix = $modx->getOption('prefix', $scriptProperties, '');

$curl = curl_init();

curl_setopt_array($curl, array(
    CURLOPT_URL => "https://vimeo.com/api/oembed.json?url=" . $videoURL,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => "",
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "GET",
    CURLOPT_POSTFIELDS => "",
    CURLOPT_HTTPHEADER => array(
        "Referer: " . $_SERVER['HTTP_REFERER'] . ""
    ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

// this returns JSON so decode it into an object
$response = json_decode($response);
curl_close($curl);

$thumbURL = $response->thumbnail_url;
$videoID = $response->video_id;

$thumbSplit = explode('_', $thumbURL);
$thumbID = str_replace('https://i.vimeocdn.com/video/', '', $thumbSplit[0]);

$modx->toPlaceholder('vimeoID', $videoID, $prefix);
$modx->toPlaceholder('vimeoThumbID', $thumbID, $prefix);

return '';