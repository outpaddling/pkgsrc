# $NetBSD: options.mk,v 1.2 2009/05/07 14:03:26 obache Exp $
#

PKG_OPTIONS_VAR=	PKG_OPTIONS.x11vnc
PKG_SUPPORTED_OPTIONS=	avahi x11
PKG_SUGGESTED_OPTIONS=	x11

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mavahi)
.include "../../net/avahi/buildlink3.mk"
CONFIGURE_ARGS+=	--with-avahi=${BUILDLINK_PREFIX.avahi}
.else
CONFIGURE_ARGS+=	--without-avahi
.endif

.if !empty(PKG_OPTIONS:Mx11)
CONFIGURE_ARGS+=		--with-x
BUILDLINK_DEPMETHOD.libXt?=	build
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXdamage/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXfixes/buildlink3.mk"
.include "../../x11/libXinerama/buildlink3.mk"
.include "../../x11/libXrandr/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../x11/libXtst/buildlink3.mk"
.include "../../x11/xextproto/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-x
.endif
