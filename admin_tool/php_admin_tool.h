/* admin_tool extension for PHP */

#ifndef PHP_ADMIN_TOOL_H
# define PHP_ADMIN_TOOL_H

extern zend_module_entry admin_tool_module_entry;
# define phpext_admin_tool_ptr &admin_tool_module_entry

# define PHP_ADMIN_TOOL_VERSION "0.1.0"

# if defined(ZTS) && defined(COMPILE_DL_ADMIN_TOOL)
ZEND_TSRMLS_CACHE_EXTERN()
# endif

#endif	/* PHP_ADMIN_TOOL_H */

