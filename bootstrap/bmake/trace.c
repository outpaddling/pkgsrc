/*	$NetBSD: trace.c,v 1.1.1.1 2004/03/11 13:04:13 grant Exp $	*/

/*-
 * Copyright (c) 2000 The NetBSD Foundation, Inc.
 * All rights reserved.
 *
 * This code is derived from software contributed to The NetBSD Foundation
 * by Bill Sommerfeld
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *        This product includes software developed by the NetBSD
 *        Foundation, Inc. and its contributors.
 * 4. Neither the name of The NetBSD Foundation nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */


#ifdef MAKE_BOOTSTRAP
static char rcsid[] = "$NetBSD: trace.c,v 1.1.1.1 2004/03/11 13:04:13 grant Exp $";
#else
#include <sys/cdefs.h>
#ifndef lint
__RCSID("$NetBSD: trace.c,v 1.1.1.1 2004/03/11 13:04:13 grant Exp $");
#endif /* not lint */
#endif

/*-
 * trace.c --
 *	handle logging of trace events generated by various parts of make.
 *
 * Interface:
 *	Trace_Init		Initialize tracing (called once during
 *				the lifetime of the process)
 *
 *	Trace_End		Finalize tracing (called before make exits)
 *
 *	Trace_Log		Log an event about a particular make job.
 */

#include <stdio.h>
#include <unistd.h>
#include <sys/time.h>

#include "make.h"
#include "job.h"
#include "trace.h"

static FILE *trfile;
static pid_t trpid;
char *trwd;

static const char *evname[] = {
	"BEG",
	"END",
	"ERR",
	"JOB",
	"DON",
	"INT",
};

void
Trace_Init(pathname)
	const char *pathname;
{
	char *p1;
	if (pathname != NULL) {
		trpid = getpid();
		trwd = Var_Value(".CURDIR", VAR_GLOBAL, &p1);

		trfile = fopen(pathname, "a");
	}
}

void
Trace_Log(event, job)
	TrEvent event;
	Job *job;
{
	struct timeval now;
	
	if (trfile == NULL)
		return;

	gettimeofday(&now, NULL);

	fprintf(trfile, "%ld.%06d %d %d %s %d %s",
	    now.tv_sec, (int)now.tv_usec,
	    jobTokensRunning, jobTokensFree,
	    evname[event], trpid, trwd);
	if (job != NULL) {
		fprintf(trfile, " %s %d %x %x", job->node->name,
		    job->pid, job->flags, job->node->type);
	}
	fputc('\n', trfile);
	fflush(trfile);
}

void
Trace_End()
{
	if (trfile != NULL)
		fclose(trfile);
}
