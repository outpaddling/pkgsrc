# $NetBSD: buildlink3.mk,v 1.8 2010/11/28 21:12:54 adam Exp $

BUILDLINK_TREE+=	libcanberra

.if !defined(LIBCANBERRA_BUILDLINK3_MK)
LIBCANBERRA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libcanberra+=	libcanberra>=0.10
BUILDLINK_ABI_DEPENDS.libcanberra+=	libcanberra>=0.22nb4
BUILDLINK_PKGSRCDIR.libcanberra?=	../../audio/libcanberra

#.include "../../multimedia/gstreamer0.10/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../audio/libvorbis/buildlink3.mk"
.include "../../devel/libltdl/buildlink3.mk"
.endif # LIBCANBERRA_BUILDLINK3_MK

BUILDLINK_TREE+=	-libcanberra
