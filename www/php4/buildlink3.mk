# $NetBSD: buildlink3.mk,v 1.1 2004/04/24 23:03:25 xtraeme Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PHP_BUILDLINK3_MK:=	${PHP_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	php
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nphp}
BUILDLINK_PACKAGES+=	php

.if !empty(PHP_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.php+=		php>=4.3.6
BUILDLINK_PKGSRCDIR.php?=	../../www/php4
BUILDLINK_DEPMETHOD.php=	build
.endif	# PHP_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
