<?php
$output = $input;
$output = str_replace('/', '\/', $output);
$output = str_replace("'", "\'", $output);
$output = str_replace("\n", '', $output);
$output = preg_replace("/(>+(\s)*<+)/", '><', $output);
$output = preg_replace("/\s+/", ' ', $output);
return $output;