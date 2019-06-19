/* self_concat extension for PHP */

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include "php.h"
#include "ext/standard/info.h"
#include "php_self_concat.h"

/* For compatibility with older PHP versions */
#ifndef ZEND_PARSE_PARAMETERS_NONE
#define ZEND_PARSE_PARAMETERS_NONE() \
	ZEND_PARSE_PARAMETERS_START(0, 0) \
	ZEND_PARSE_PARAMETERS_END()
#endif

/* self_concat() */
PHP_FUNCTION(self_concat)
{
	char *str = NULL;
	int str_len;
	long n;
	char *result;  // ptr
	char *ptr;
	int result_length;
	if(zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "sl", &str, &str_len, &n) == FAILURE){
		return;
	}
	result_length = (str_len*n);
	// allocate memory for result string
	result = (char *) emalloc(result_length + 1);
	// ptr to the beginning of the string
	ptr = result;
	while(n--){
		memcpy(ptr, str, str_len);
		ptr += str_len;
	}
	// use NULL to terminate the string
	*ptr = '\0';
	RETURN_STRINGL(result, result_length);
}

/* {{{ void self_concat_test1()
 */
PHP_FUNCTION(self_concat_test1)
{
	ZEND_PARSE_PARAMETERS_NONE();

	php_printf("The extension %s is loaded and working!\r\n", "self_concat");
}
/* }}} */

/* {{{ string self_concat_test2( [ string $var ] )
 */
PHP_FUNCTION(self_concat_test2)
{
	char *var = "World";
	size_t var_len = sizeof("World") - 1;
	zend_string *retval;

	ZEND_PARSE_PARAMETERS_START(0, 1)
		Z_PARAM_OPTIONAL
		Z_PARAM_STRING(var, var_len)
	ZEND_PARSE_PARAMETERS_END();

	retval = strpprintf(0, "Hello %s", var);

	RETURN_STR(retval);
}
/* }}}*/

/* {{{ PHP_RINIT_FUNCTION
 */
PHP_RINIT_FUNCTION(self_concat)
{
#if defined(ZTS) && defined(COMPILE_DL_SELF_CONCAT)
	ZEND_TSRMLS_CACHE_UPDATE();
#endif

	return SUCCESS;
}
/* }}} */

/* {{{ PHP_MINFO_FUNCTION
 */
PHP_MINFO_FUNCTION(self_concat)
{
	php_info_print_table_start();
	php_info_print_table_header(2, "self_concat support", "enabled");
	php_info_print_table_end();
}
/* }}} */

/* {{{ arginfo
 */
ZEND_BEGIN_ARG_INFO(arginfo_self_concat_test1, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO(arginfo_self_concat_test2, 0)
	ZEND_ARG_INFO(0, str)
ZEND_END_ARG_INFO()
/* }}} */

/* {{{ self_concat_functions[]
 */
static const zend_function_entry self_concat_functions[] = {
    PHP_FE(self_concat, NULL)
	PHP_FE(self_concat_test1,		arginfo_self_concat_test1)
	PHP_FE(self_concat_test2,		arginfo_self_concat_test2)
	PHP_FE_END
};
/* }}} */

/* {{{ self_concat_module_entry
 */
zend_module_entry self_concat_module_entry = {
	STANDARD_MODULE_HEADER,
	"self_concat",					/* Extension name */
	self_concat_functions,			/* zend_function_entry */
	NULL,							/* PHP_MINIT - Module initialization */
	NULL,							/* PHP_MSHUTDOWN - Module shutdown */
	PHP_RINIT(self_concat),			/* PHP_RINIT - Request initialization */
	NULL,							/* PHP_RSHUTDOWN - Request shutdown */
	PHP_MINFO(self_concat),			/* PHP_MINFO - Module info */
	PHP_SELF_CONCAT_VERSION,		/* Version */
	STANDARD_MODULE_PROPERTIES
};
/* }}} */

#ifdef COMPILE_DL_SELF_CONCAT
# ifdef ZTS
ZEND_TSRMLS_CACHE_DEFINE()
# endif
ZEND_GET_MODULE(self_concat)
#endif

