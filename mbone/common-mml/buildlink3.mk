# $NetBSD: buildlink3.mk,v 1.3 2006/04/11 18:39:41 minskim Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
COMMON_MML_BUILDLINK3_MK:=	${COMMON_MML_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	common-mml
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ncommon-mml}
BUILDLINK_PACKAGES+=	common-mml

.if !empty(COMMON_MML_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.common-mml+=	common-mml>=1.2.14
BUILDLINK_PKGSRCDIR.common-mml?=	../../mbone/common-mml
.endif	# COMMON_MML_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
