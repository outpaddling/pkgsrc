# $NetBSD: buildlink3.mk,v 1.15 2018/04/14 07:34:07 adam Exp $

BUILDLINK_TREE+=	qt5-qtmacextras

.if !defined(QT5_QTMACEXTRAS_BUILDLINK3_MK)
QT5_QTMACEXTRAS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.qt5-qtmacextras+=	qt5-qtmacextras>=5.9.1
BUILDLINK_ABI_DEPENDS.qt5-qtmacextras+=	qt5-qtmacextras>=5.10.1nb2
BUILDLINK_PKGSRCDIR.qt5-qtmacextras?=	../../x11/qt5-qtmacextras

BUILDLINK_INCDIRS.qt5-qtmacextras+=	qt5/include
BUILDLINK_LIBDIRS.qt5-qtmacextras+=	qt5/lib
BUILDLINK_LIBDIRS.qt5-qtmacextras+=	qt5/plugins

.include "../../x11/qt5-qtxmlpatterns/buildlink3.mk"
.endif	# QT5_QTMACEXTRAS_BUILDLINK3_MK

BUILDLINK_TREE+=	-qt5-qtmacextras
