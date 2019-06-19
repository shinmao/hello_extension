--TEST--
Check if self_concat is loaded
--SKIPIF--
<?php
if (!extension_loaded('self_concat')) {
	echo 'skip';
}
?>
--FILE--
<?php
echo 'The extension "self_concat" is available';
?>
--EXPECT--
The extension "self_concat" is available
