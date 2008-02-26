/*-
 * Copyright (c) 2003-2007 Tim Kientzle
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#include "test.h"
__FBSDID("$FreeBSD: src/lib/libarchive/test/test_empty_write.c,v 1.1 2008/01/01 22:28:04 kientzle Exp $");

DEFINE_TEST(test_empty_write)
{
	char buff[32768];
	struct archive_entry *ae;
	struct archive *a;
	size_t used;

	/*
	 * Exercise a zero-byte write to a gzip-compressed archive.
	 */

	/* Create a new archive in memory. */
	assert((a = archive_write_new()) != NULL);
	assertA(0 == archive_write_set_format_ustar(a));
	assertA(0 == archive_write_set_compression_gzip(a));
	assertA(0 == archive_write_open_memory(a, buff, sizeof(buff), &used));
	/* Write a file to it. */
	assert((ae = archive_entry_new()) != NULL);
	archive_entry_copy_pathname(ae, "file");
	archive_entry_set_mode(ae, S_IFREG | 0755);
	archive_entry_set_size(ae, 0);
	assertA(0 == archive_write_header(a, ae));

	/* THE TEST: write zero bytes to this entry. */
	/* This used to crash. */
	assertEqualIntA(a, 0, archive_write_data(a, "", 0));

	/* Close out the archive. */
	assertA(0 == archive_write_close(a));
#if ARCHIVE_API_VERSION > 1
	assertA(0 == archive_write_finish(a));
#else
	archive_write_finish(a);
#endif


	/*
	 * Again, with bzip2 compression.
	 */

	/* Create a new archive in memory. */
	assert((a = archive_write_new()) != NULL);
	assertA(0 == archive_write_set_format_ustar(a));
	assertA(0 == archive_write_set_compression_bzip2(a));
	assertA(0 == archive_write_open_memory(a, buff, sizeof(buff), &used));
	/* Write a file to it. */
	assert((ae = archive_entry_new()) != NULL);
	archive_entry_copy_pathname(ae, "file");
	archive_entry_set_mode(ae, S_IFREG | 0755);
	archive_entry_set_size(ae, 0);
	assertA(0 == archive_write_header(a, ae));

	/* THE TEST: write zero bytes to this entry. */
	assertEqualIntA(a, 0, archive_write_data(a, "", 0));

	/* Close out the archive. */
	assertA(0 == archive_write_close(a));
#if ARCHIVE_API_VERSION > 1
	assertA(0 == archive_write_finish(a));
#else
	archive_write_finish(a);
#endif


	/*
	 * For good measure, one more time with no compression.
	 */

	/* Create a new archive in memory. */
	assert((a = archive_write_new()) != NULL);
	assertA(0 == archive_write_set_format_ustar(a));
	assertA(0 == archive_write_set_compression_none(a));
	assertA(0 == archive_write_open_memory(a, buff, sizeof(buff), &used));
	/* Write a file to it. */
	assert((ae = archive_entry_new()) != NULL);
	archive_entry_copy_pathname(ae, "file");
	archive_entry_set_mode(ae, S_IFREG | 0755);
	archive_entry_set_size(ae, 0);
	assertA(0 == archive_write_header(a, ae));

	/* THE TEST: write zero bytes to this entry. */
	assertEqualIntA(a, 0, archive_write_data(a, "", 0));

	/* Close out the archive. */
	assertA(0 == archive_write_close(a));
#if ARCHIVE_API_VERSION > 1
	assertA(0 == archive_write_finish(a));
#else
	archive_write_finish(a);
#endif
}
