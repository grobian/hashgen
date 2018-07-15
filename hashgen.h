/* Copyright 2006-2018 Gentoo Foundation; Distributed under the GPL v2 */

/* linked list structure to hold verification complaints */
typedef struct verify_msg {
	char *msg;
	struct verify_msg *next;
} verify_msg;

typedef struct _gpg_signature {
	char *algo;
	char *fingerprint;
	char isgood:1;
	char *timestamp;
	char *signer;
	char *pkfingerprint;
	char *reason;
} gpg_sig;

gpg_sig *verify_gpg_sig(const char *path, verify_msg **msgs);
char *verify_timestamp(const char *ts);
char verify_manifest(const char *dir, const char *manifest, verify_msg **msgs);
