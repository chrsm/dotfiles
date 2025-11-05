<?php
error_reporting(E_ALL ^ E_DEPRECATED);
$includes = [];

if (file_exists(__DIR__ . '/vendor')) {
  require_once(__DIR__ . '/vendor/autoload.php');

  $def = get_defined_functions();
  $fns = Functional\select($def['user'], function ($fn) {
    return substr($fn, 0, strlen('functional\\')) == 'functional\\';
  });

  Functional\every($fns, function ($fn) { 
    $name = substr($fn, strlen('functional\\'));
    $export = $name;
    if ($name == 'sort') {
      $export = 'sort_f';
    }

    $def = 'function ' . $export . "() {" .
           "return call_user_func_array('functional\\$name', func_get_args()); }\n" .
           "return true;";

    return eval($def);
  });
} else {
  echo "WARNING: vendor deps not installed in " . __DIR__ . "\n\n";
}

return [
  'defaultIncludes' => $includes,
  'errorLoggingLevel' => E_ALL ^ E_DEPRECATED,
  'forceArrayIndexes' => true,
  'eraseDuplicates' => true,
  'useBracketedPaste' => true,
  'historySize' => 0,
  'theme' => 'modern',
  'implicitUse' => [
    'includeNamespaces' => [ 'Functional\\' ],
  ],
  'warmAutoload' => [
    'includeVendor' => true,
  ],
];
