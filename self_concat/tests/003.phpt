--TEST--
self_concat_test2() Basic test
--SKIPIF--
<?php
if (!extension_loaded('self_concat')) {
	echo 'skip';
}
?>
--FILE--
<?php
var_dump(self_concat_test2());
var_dump(self_concat_test2('PHP'));
?>
--EXPECT--
string(11) "Hello World"
string(9) "Hello PHP"
