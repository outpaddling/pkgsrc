# $NetBSD: buildlink3.mk,v 1.10 2014/04/29 07:56:48 wiz Exp $

BUILDLINK_TREE+=	poppler-includes

.if !defined(POPPLER_INCLUDES_BUILDLINK3_MK)
POPPLER_INCLUDES_BUILDLINK3_MK:=

BUILDLINK_DEPMETHOD.poppler-includes?=	build

BUILDLINK_API_DEPENDS.poppler-includes+=	poppler-includes>=0.22.2
BUILDLINK_ABI_DEPENDS.poppler-includes?=	poppler-includes>=0.26.0
BUILDLINK_PKGSRCDIR.poppler-includes?=	../../print/poppler-includes
.endif # POPPLER_INCLUDES_BUILDLINK3_MK

BUILDLINK_TREE+=	-poppler-includes
