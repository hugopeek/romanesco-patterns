<?php
/* stripWords snippet */
$words = array_map('trim', explode(',', $options));
return str_replace($words, '', $input);