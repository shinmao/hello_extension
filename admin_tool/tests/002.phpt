--TEST--
admin_tool_test1() Basic test
--SKIPIF--
<?php
if (!extension_loaded('admin_tool')) {
	echo 'skip';
}
?>
--FILE--
<?php
$ret = admin_tool_test1();

var_dump($ret);
?>
--EXPECT--
The extension admin_tool is loaded and working!
NULL
