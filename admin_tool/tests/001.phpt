--TEST--
Check if admin_tool is loaded
--SKIPIF--
<?php
if (!extension_loaded('admin_tool')) {
	echo 'skip';
}
?>
--FILE--
<?php
echo 'The extension "admin_tool" is available';
?>
--EXPECT--
The extension "admin_tool" is available
