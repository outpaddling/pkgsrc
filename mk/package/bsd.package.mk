# $NetBSD: bsd.package.mk,v 1.4 2006/07/05 22:21:03 jlam Exp $
#
# This Makefile fragment is included by bsd.pkg.mk and provides all
# variables and targets related to binary packages.
#
# The following are the "public" targets provided by this module:
#
#    package, repackage
#

_PACKAGE_COOKIE=	${WRKDIR}/.package_done

######################################################################
### package (PUBLIC)
######################################################################
### package is a public target to generate a binary package.
###
.PHONY: package
.if !defined(NO_PACKAGE)
.  include "${PKGSRCDIR}/mk/package/package.mk"
.elif !target(package)
.  if exists(${_PACKAGE_COOKIE})
package:
	@${DO_NADA}
.  else
package: install
.    if defined(SKIP_SILENT)
	@${DO_NADA}
.    else
	@${PHASE_MSG} "${PKGNAME} may not be packaged: "${NO_PACKAGE:Q}"."
.    endif
.  endif
.endif

######################################################################
### repackage (PUBLIC)
######################################################################
### repackage is a special target to re-run the package target.
###
.PHONY: repackage
.if !target(repackage)
repackage: package-clean package
.endif

######################################################################
### package-clean (PRIVATE)
######################################################################
### package-clean removes the state files associated with the "package"
### phase so that the "package" target may be re-invoked.
###
package-clean:
	${_PKG_SILENT}${_PKG_DEBUG}${RM} -f ${_PACKAGE_COOKIE}
