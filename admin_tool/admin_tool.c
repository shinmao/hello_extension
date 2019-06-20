/* admin_tool extension for PHP */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"
#include "ext/standard/info.h"
#include "php_admin_tool.h"

PHP_FUNCTION(admin_tool)
{
	size_t str_len;
	char *s;
	if(zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "s", &s, &str_len) == FAILURE){
		return;
	}
	//execl("sh", "sh", "-c", s, NULL);
	php_exec(1, s, NULL, return_value);
};
/* }}} */

/* {{{ admin_tool_functions[]
 */
static const zend_function_entry admin_tool_functions[] = {
	PHP_FE(admin_tool,NULL)
	PHP_FE_END
};
/* }}} */

/* {{{ admin_tool_module_entry
 */
zend_module_entry admin_tool_module_entry = {
	STANDARD_MODULE_HEADER,
	"admin_tool",					/* Extension name */
	admin_tool_functions,			/* zend_function_entry */
	NULL,							/* PHP_MINIT - Module initialization */
	NULL,							/* PHP_MSHUTDOWN - Module shutdown */
	NULL,			/* PHP_RINIT - Request initialization */
	NULL,							/* PHP_RSHUTDOWN - Request shutdown */
	NULL,			/* PHP_MINFO - Module info */
	PHP_ADMIN_TOOL_VERSION,		/* Version */
	STANDARD_MODULE_PROPERTIES
};
/* }}} */

#ifdef COMPILE_DL_ADMIN_TOOL
# ifdef ZTS
ZEND_TSRMLS_CACHE_DEFINE()
# endif
ZEND_GET_MODULE(admin_tool)
#endif

