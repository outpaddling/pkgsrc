# $NetBSD: buildlink3.mk,v 1.20 2024/04/22 07:06:39 adam Exp $

BUILDLINK_TREE+=	lldb

.if !defined(LLDB_BUILDLINK3_MK)
LLDB_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.lldb+=	lldb>=17.0.0<18
BUILDLINK_ABI_DEPENDS.lldb+=	lldb>=17.0.0
BUILDLINK_PKGSRCDIR.lldb?=	../../devel/lldb

.include "../../devel/zlib/buildlink3.mk"
.include "../../lang/clang/buildlink3.mk"
.include "../../lang/llvm/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.endif	# LLDB_BUILDLINK3_MK

BUILDLINK_TREE+=	-lldb
