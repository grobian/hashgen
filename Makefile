# build hashgen

LIBS = -lssl -lcrypto -lb2 -lz `gpgme-config --libs`

hashgen: hashgen.c
	$(CC) -o $@ -fopenmp $(CFLAGS) $(LDFLAGS) $(LIBS) $^

hashverify: hashgen
	ln -s hashgen hashverify

hashgen.so: hashgen.c
	$(CC) -shared -o $@ -fopenmp -DBUILD_LIB $(CFLAGS) $(LDFLAGS) $(LIBS) $^

hashgen.dylib: hashgen.c
	$(CC) -dynamiclib -o $@ -fopenmp -DBUILD_LIB $(CFLAGS) $(LDFLAGS) $(LIBS) $^

clean:
	rm -f hashgen hashverify hashgen.so hashgen.dylib
