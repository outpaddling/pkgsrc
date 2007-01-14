# $NetBSD: buildlink3.mk,v 1.2 2007/01/14 10:57:47 joerg Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBDRM_BUILDLINK3_MK:=	${LIBDRM_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	libdrm
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibdrm}
BUILDLINK_PACKAGES+=	libdrm
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}libdrm

.if ${LIBDRM_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.libdrm+=	libdrm>=2.3.0
BUILDLINK_PKGSRCDIR.libdrm?=	../../x11/libdrm
.endif	# LIBDRM_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
