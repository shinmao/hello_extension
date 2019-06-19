--TEST--
self_concat_test1() Basic test
--SKIPIF--
<?php
if (!extension_loaded('self_concat')) {
	echo 'skip';
}
?>
--FILE--
<?php
$ret = self_concat_test1();

var_dump($ret);
?>
--EXPECT--
The extension self_concat is loaded and working!
NULL
