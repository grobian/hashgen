# build hashgen

LIBS = -lssl -lcrypto -lb2 -lz `gpgme-config --libs`

hashgen: hashgen.c
	$(CC) -o $@ -fopenmp $(CFLAGS) $(LDFLAGS) $(LIBS) $^

clean:
	rm -f hashgen
