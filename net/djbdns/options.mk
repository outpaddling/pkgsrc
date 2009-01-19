# $NetBSD: options.mk,v 1.11 2009/01/19 10:27:31 sketch Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.djbdns
PKG_SUPPORTED_OPTIONS+=	inet6 djbdns-cachestats djbdns-ignoreip2 djbdns-tinydns64

.if ${MACHINE_ARCH} == "sparc64" || \
	${MACHINE_ARCH} == "alpha" || \
	${MACHINE_ARCH} == "x86_64"
PKG_SUGGESTED_OPTIONS+=   djbdns-tinydns64
.endif

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Minet6)
IPV6_PATCH=			djbdns-1.05-ipv6.diff.bz2
PATCHFILES+=			${IPV6_PATCH}
SITES.${IPV6_PATCH}=		http://www.fefe.de/dns/
PATCH_DIST_STRIP.${IPV6_PATCH}=	-p1
PLIST_SRC+=			${PKGDIR}/PLIST.inet6
.endif

.if !empty(PKG_OPTIONS:Mdjbdns-cachestats)
CACHESTATS_PATCH=		djbdns-cachestats.patch
PATCHFILES+=			${CACHESTATS_PATCH}
SITES.${CACHESTATS_PATCH}=	http://romana.now.ie/software/
PATCH_DIST_STRIP.${CACHESTATS_PATCH}= -p1
.endif

.if !empty(PKG_OPTIONS:Mdjbdns-ignoreip2)
IGNOREIP2_PATCH=		djbdns-1.05-ignoreip2.patch
PATCHFILES+=			${IGNOREIP2_PATCH}
SITES.${IGNOREIP2_PATCH}=	http://www.tinydns.org/
.endif

.if !empty(PKG_OPTIONS:Mdjbdns-tinydns64)
post-patch:
	@cd ${WRKSRC} && ${PATCH} ${PATCH_ARGS} < ${FILESDIR}/patch-tinydns64
.endif
