/* self_concat extension for PHP */

#ifndef PHP_SELF_CONCAT_H
# define PHP_SELF_CONCAT_H

extern zend_module_entry self_concat_module_entry;
# define phpext_self_concat_ptr &self_concat_module_entry

# define PHP_SELF_CONCAT_VERSION "0.1.0"

# if defined(ZTS) && defined(COMPILE_DL_SELF_CONCAT)
ZEND_TSRMLS_CACHE_EXTERN()
# endif

#endif	/* PHP_SELF_CONCAT_H */

