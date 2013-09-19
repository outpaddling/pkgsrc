$NetBSD: patch-security_manager_ssl_src_nsNSSComponent.cpp,v 1.2 2013/09/19 12:37:50 ryoon Exp $

--- security/manager/ssl/src/nsNSSComponent.cpp.orig	2013-09-10 03:43:51.000000000 +0000
+++ security/manager/ssl/src/nsNSSComponent.cpp
@@ -49,6 +49,7 @@
 
 #include "nss.h"
 #include "ssl.h"
+#define NSS_ENABLE_ECC 1
 #include "sslproto.h"
 #include "secmod.h"
 #include "secmime.h"
