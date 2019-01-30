<?php

/**
 * FibonacciSequence
 *
 * Generate a sequence of Fibonacci numbers. In a Fibonacci sequence, every
 * number after the first two is the sum of the two preceding ones.
 *
 * You can indicate where to start and how many numbers to generate:
 *
 * [[FibonacciSequence?
 *    &limit=`9`
 *    &start=`65`
 * ]]
 *
 * If you want to retrieve a specific number from inside the sequence, you can
 * do so using the position parameter:
 *
 * [[FibonacciSequence?
 *    &start=`40`
 *    &position=`5`
 * ]]
 *
 * Without any parameters, the script will output a comma delimited sequence of
 * 10 numbers.
 *
 * [[FibonacciSequence]]
 * will output: 0,1,1,2,3,5,8,13,21,34
 *
 * @original http://www.hashbangcode.com/blog/get-fibonacci-numbers-using-php
 */

$limit = $modx->getOption('limit', $scriptProperties, 10);
$start = $modx->getOption('start', $scriptProperties, 0);
$position = $modx->getOption('position', $scriptProperties, '');
$delimiter = $modx->getOption('delimiter', $scriptProperties, ',');

if ($start > 0) {
    $second = $start * 2;
} else {
    $second = 1;
}

$sequence = array();

if (!function_exists('fibonacciSequence')) {
    function fibonacciSequence($limit, $start, $second, $position){
        $sequence = array($start, $second);

        if ($position > $limit) {
            $limit = $position;
        }

        for ($i=2; $i<=$limit; ++$i) {
            if ($i >= $limit) {
                break;
            } else {
                $sequence[$i] = $sequence[$i-1] + $sequence[$i-2];
            }
        }

        if ($position) {
            return $sequence[$position - 1];
        } else {
            return $sequence;
        }
    }
}

$output = fibonacciSequence($limit, $start, $second, $position);

if ($position) {
    return $output;
} else {
    return implode($delimiter, $output);
}