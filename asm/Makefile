LIBS = lib/io.o lib/str.o lib/array.o lib/time.o lib/rand.o
.PHONY: default compile build dump hex run debug test
default: build run
compile: lib/io.s
	as --gstabs lib/io.s -o lib/io.o
	as --gstabs lib/str.s -o lib/str.o
	as --gstabs lib/array.s -o lib/array.o
	as --gstabs lib/time.s -o lib/time.o
	as --gstabs lib/rand.s -o lib/rand.o
build: main.s
	as main.s -o main.o
	ld main.o $(LIBS) -o main
dump: main
	objdump -S -M intel -d main > obj.dump
	cat obj.dump
hex: main
	hexeditor main
run: main
	./main $(ARGS)
debug: main.s
	as --gstabs -o main.o main.s
	ld main.o $(LIBS) -o main
	gdb main
test: 
	$(info ************  TEST 100000 ************)
	./main ../tests/test100000.txt ../tests/output100000.txt
	$(info ************  TEST 1000000 ************)
	./main ../tests/test1000000.txt ../tests/output1000000.txt
	$(info ************  TEST 10000000 ************)
	./main ../tests/test10000000.txt ../tests/output10000000.txt
	$(info ************  TEST 100000000 ************)
	./main ../tests/test100000000.txt ../tests/output100000000.txt
