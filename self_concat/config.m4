dnl config.m4 for extension self_concat

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary.

dnl If your extension references something external, use with:

dnl PHP_ARG_WITH(self_concat, for self_concat support,
dnl Make sure that the comment is aligned:
dnl [  --with-self_concat             Include self_concat support])

dnl Otherwise use enable:

PHP_ARG_ENABLE(self_concat, whether to enable self_concat support,
Make sure that the comment is aligned:
[  --enable-self_concat          Enable self_concat support], no)

if test "$PHP_SELF_CONCAT" != "no"; then
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
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBDIR, SELF_CONCAT_SHARED_LIBADD)
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)

  dnl # --with-self_concat -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/self_concat.h"  # you most likely want to change this
  dnl if test -r $PHP_SELF_CONCAT/$SEARCH_FOR; then # path given as parameter
  dnl   SELF_CONCAT_DIR=$PHP_SELF_CONCAT
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for self_concat files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       SELF_CONCAT_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$SELF_CONCAT_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the self_concat distribution])
  dnl fi

  dnl # --with-self_concat -> add include path
  dnl PHP_ADD_INCLUDE($SELF_CONCAT_DIR/include)

  dnl # --with-self_concat -> check for lib and symbol presence
  dnl LIBNAME=SELF_CONCAT # you may want to change this
  dnl LIBSYMBOL=SELF_CONCAT # you most likely want to change this

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $SELF_CONCAT_DIR/$PHP_LIBDIR, SELF_CONCAT_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_SELF_CONCATLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong self_concat lib version or lib not found])
  dnl ],[
  dnl   -L$SELF_CONCAT_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(SELF_CONCAT_SHARED_LIBADD)

  dnl # In case of no dependencies
  AC_DEFINE(HAVE_SELF_CONCAT, 1, [ Have self_concat support ])

  PHP_NEW_EXTENSION(self_concat, self_concat.c, $ext_shared)
fi
