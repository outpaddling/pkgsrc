# $NetBSD: buildlink3.mk,v 1.32 2024/04/06 08:05:04 wiz Exp $

BUILDLINK_TREE+=	kservice

.if !defined(KSERVICE_BUILDLINK3_MK)
KSERVICE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kservice+=	kservice>=5.18.0
BUILDLINK_ABI_DEPENDS.kservice?=	kservice>=5.114.0nb1
BUILDLINK_PKGSRCDIR.kservice?=		../../devel/kservice

.include "../../devel/kconfig/buildlink3.mk"
.include "../../devel/kcrash/buildlink3.mk"
.include "../../devel/ki18n/buildlink3.mk"
.include "../../sysutils/kdbusaddons/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# KSERVICE_BUILDLINK3_MK

BUILDLINK_TREE+=	-kservice
