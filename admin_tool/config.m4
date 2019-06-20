dnl config.m4 for extension admin_tool

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary.

dnl If your extension references something external, use with:

dnl PHP_ARG_WITH(admin_tool, for admin_tool support,
dnl Make sure that the comment is aligned:
dnl [  --with-admin_tool             Include admin_tool support])

dnl Otherwise use enable:

PHP_ARG_ENABLE(admin_tool, whether to enable admin_tool support,
dnl Make sure that the comment is aligned:
[  --enable-admin_tool          Enable admin_tool support], no)

if test "$PHP_ADMIN_TOOL" != "no"; then
  dnl Write more examples of tests here...

  dnl # get library FOO build options from pkg-config output
  dnl AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
  dnl AC_MSG_CHECKING(for libfoo)
  dnl if test -x "$PKG_CONFIG" && $PKG_CONFIG --exists foo; then
  dnl   if $PKG_CONFIG foo --atleast-version 1.2.3; then
  dnl     LIBFOO_CFLAGS=\`$PKG_CONFIG foo --cflags\`
  dnl     LIBFOO_LIBDIR=\`$PKG_CONFIG foo --libs\`
  dnl     LIBFOO_VERSON=\`$PKG_CONFIG foo --modversion\`
  dnl     AC_MSG_RESULT(from pkgconfig: version $LIBFOO_VERSON)
  dnl   else
  dnl     AC_MSG_ERROR(system libfoo is too old: version 1.2.3 required)
  dnl   fi
  dnl else
  dnl   AC_MSG_ERROR(pkg-config not found)
  dnl fi
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBDIR, ADMIN_TOOL_SHARED_LIBADD)
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)

  dnl # --with-admin_tool -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/admin_tool.h"  # you most likely want to change this
  dnl if test -r $PHP_ADMIN_TOOL/$SEARCH_FOR; then # path given as parameter
  dnl   ADMIN_TOOL_DIR=$PHP_ADMIN_TOOL
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for admin_tool files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       ADMIN_TOOL_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$ADMIN_TOOL_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the admin_tool distribution])
  dnl fi

  dnl # --with-admin_tool -> add include path
  dnl PHP_ADD_INCLUDE($ADMIN_TOOL_DIR/include)

  dnl # --with-admin_tool -> check for lib and symbol presence
  dnl LIBNAME=ADMIN_TOOL # you may want to change this
  dnl LIBSYMBOL=ADMIN_TOOL # you most likely want to change this

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $ADMIN_TOOL_DIR/$PHP_LIBDIR, ADMIN_TOOL_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_ADMIN_TOOLLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong admin_tool lib version or lib not found])
  dnl ],[
  dnl   -L$ADMIN_TOOL_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(ADMIN_TOOL_SHARED_LIBADD)

  dnl # In case of no dependencies
  AC_DEFINE(HAVE_ADMIN_TOOL, 1, [ Have admin_tool support ])

  PHP_NEW_EXTENSION(admin_tool, admin_tool.c, $ext_shared)
fi
