$NetBSD: patch-qpdfview.pri,v 1.2 2013/02/25 21:36:51 ryoon Exp $

* Set install places

--- qpdfview.pri.orig	2013-02-16 12:42:07.000000000 +0000
+++ qpdfview.pri
@@ -1,6 +1,5 @@
-isEmpty(TARGET_INSTALL_PATH):TARGET_INSTALL_PATH = /usr/bin
-isEmpty(PLUGIN_INSTALL_PATH):PLUGIN_INSTALL_PATH = /usr/lib/qpdfview
-isEmpty(DATA_INSTALL_PATH):DATA_INSTALL_PATH = /usr/share/qpdfview
-isEmpty(LAUNCHER_INSTALL_PATH):LAUNCHER_INSTALL_PATH = /usr/share/applications
-isEmpty(MANUAL_INSTALL_PATH):MANUAL_INSTALL_PATH = /usr/share/man/man1
-
+isEmpty(TARGET_INSTALL_PATH):TARGET_INSTALL_PATH = @DESTDIR@@PREFIX@/bin
+isEmpty(PLUGIN_INSTALL_PATH):PLUGIN_INSTALL_PATH = @DESTDIR@@PREFIX@/lib/qpdfview
+isEmpty(DATA_INSTALL_PATH):DATA_INSTALL_PATH = @DESTDIR@@PREFIX@/share/qpdfview
+isEmpty(LAUNCHER_INSTALL_PATH):LAUNCHER_INSTALL_PATH = @DESTDIR@@PREFIX@/share/applications
+isEmpty(MANUAL_INSTALL_PATH):MANUAL_INSTALL_PATH = @DESTDIR@@PREFIX@/@PKGMANDIR@/man1
