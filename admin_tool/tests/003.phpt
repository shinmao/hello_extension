--TEST--
admin_tool_test2() Basic test
--SKIPIF--
<?php
if (!extension_loaded('admin_tool')) {
	echo 'skip';
}
?>
--FILE--
<?php
var_dump(admin_tool_test2());
var_dump(admin_tool_test2('PHP'));
?>
--EXPECT--
string(11) "Hello World"
string(9) "Hello PHP"
