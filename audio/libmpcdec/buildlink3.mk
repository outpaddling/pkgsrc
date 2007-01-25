# $NetBSD: buildlink3.mk,v 1.1.1.1 2007/01/25 19:31:34 drochner Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBMPCDEC_BUILDLINK3_MK:=	${LIBMPCDEC_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	libmpcdec
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibmpcdec}
BUILDLINK_PACKAGES+=	libmpcdec
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}libmpcdec

.if ${LIBMPCDEC_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.libmpcdec+=	libmpcdec>=1.2.4
BUILDLINK_PKGSRCDIR.libmpcdec?=	../../audio/libmpcdec
.endif	# LIBMPCDEC_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
