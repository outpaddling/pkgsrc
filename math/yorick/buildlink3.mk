# $NetBSD: buildlink3.mk,v 1.1 2004/05/09 00:44:17 snj Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
YORICK_BUILDLINK3_MK:=	${YORICK_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	yorick
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nyorick}
BUILDLINK_PACKAGES+=	yorick

.if !empty(YORICK_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.yorick+=	yorick>=1.5.12
BUILDLINK_DEPMETHOD.yorick?=	build
BUILDLINK_PKGSRCDIR.yorick?=	../../math/yorick
.endif	# YORICK_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
