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
$imgSize = $modx->getOption('imgSize', $scriptProperties, $options);
$imgType = $modx->getOption('imgType', $scriptProperties, 'webp');
$prefix = $modx->getOption('prefix', $scriptProperties, '');

$cacheKey = 'video';
$cacheManager = $modx->getCacheManager();
$cacheLifetime = (int)$modx->getOption('cacheLifetime', $scriptProperties, 7 * 24 * 60 * 60, true);
$cacheOptions = [
    xPDO::OPT_CACHE_KEY => $cacheKey,
];
$fromCache = true;
$data = $cacheManager->get($cacheKey, $cacheOptions);

// Use pThumb cache location if activated
if ($modx->getOption('pthumb.use_ptcache', null, true) ) {
    $cachePath = $modx->getOption('pthumb.ptcache_location', null, 'assets/cache/img', true);
} else {
    $cachePath = $modx->getOption('phpthumbof.cache_path', null, "assets/components/phpthumbof/cache", true);
}
$cachePath = rtrim($cachePath, '/') . '/' . $cacheKey . '/';
$cachePathFull = MODX_BASE_PATH . $cachePath;

// Invalidate cache if URL changed
if (is_array($data) && array_diff($data['properties'], $scriptProperties)) {
    $data = '';
}

// Invalidate cache if thumbnail can't be found
if (is_array($data) && !file_exists(MODX_BASE_PATH . $data['thumbPath'])) {
    $data = '';
}

// Make the request and fetch thumbnail
if (!is_array($data)) {
    $fromCache = false;
    $curl = curl_init();

    curl_setopt_array($curl, array(
        CURLOPT_URL => "https://vimeo.com/api/oembed.json?url=" . $videoURL,
        CURLOPT_AUTOREFERER => true,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 3,
        CURLOPT_TIMEOUT => 10,
        CURLOPT_CUSTOMREQUEST => "GET",
        CURLOPT_POSTFIELDS => "",
    ));

    $response = curl_exec($curl);
    $error = curl_error($curl);
    curl_close($curl);

    if ($error) {
        $modx->log(modX::LOG_LEVEL_ERROR, $error);
        return;
    }

    // Response is in JSON
    $response = json_decode($response, 1);

    // Construct proper thumb URL
    $thumbURL = $response['thumbnail_url'];
    $videoID = $response['video_id'];

    $thumbSplit = explode('_', $thumbURL);
    $thumbID = str_replace('https://i.vimeocdn.com/video/', '', $thumbSplit[0]);
    $thumbURL = 'https://i.vimeocdn.com/video/' . $thumbID . '_' . $imgSize . '.' . $imgType;

    // Write image file to assets cache folder
    $thumbFile = file_get_contents($thumbURL);
    $thumbFileName = 'vimeo-' . $videoID . '.' . $imgSize . '.' . $imgType;
    $thumbPath = $cachePath . $thumbFileName;

    if (!@is_dir($cachePathFull)) {
        if (!@mkdir($cachePathFull, 0755)) {
            $this->modx->log(xPDO::LOG_LEVEL_ERROR, '[getVideoData] Could not create the cache path.', '', 'Romanesco');
        }
    }
    file_put_contents(MODX_BASE_PATH . $thumbPath, $thumbFile);

    // Create array of data to be cached
    $data = [
        'properties' => $scriptProperties,
        'response' => $response,
        'thumbURL' => $thumbURL,
        'thumbPath' => $thumbPath,
    ];

    $cacheManager->set($cacheKey, $data, $cacheLifetime, $cacheOptions);
}

if (!is_array($data)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[getVimeoData] Could not find requested data');
    return '';
}

// Load data from cache
$modx->toPlaceholder('vimeoID', $data['response']['video_id'], $prefix);
$modx->toPlaceholder('vimeoThumb', $data['thumbPath'], $prefix);

//return '<p>From cache: ' . ($fromCache ? 'Yes' : 'No');

return '';