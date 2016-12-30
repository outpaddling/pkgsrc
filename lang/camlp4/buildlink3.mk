# $NetBSD: buildlink3.mk,v 1.3 2016/12/30 11:43:36 jaapb Exp $

BUILDLINK_TREE+=	camlp4

.if !defined(CAMLP4_BUILDLINK3_MK)
CAMLP4_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.camlp4+=	camlp4>=4.04
BUILDLINK_PKGSRCDIR.camlp4?=	../../lang/camlp4
.endif	# CAMLP4_BUILDLINK3_MK

BUILDLINK_TREE+=	-camlp4
