# libasm
My libasm (written in NASM syntax)

## Functions and and relevant structure declarations
Check out the `libasm.h` file in the `attachment` directory.

## How to build and remove
Install nasm.
```bash
brew install nasm # macOS
apt install nasm # debian, ubuntu
apk add nasm # alpine
# or else
```
Build the library.
```bash
make # builds the relocatable object files in the directory .objs/ and the library archive (libasm.a) in the current directory.
make clean # removes .objs/*
make fclean # removes .objs/* and libasm.a
```

## How to use (example)
Write a `main` and link the library (`libasm.a`) to it.
```bash
git clone git@github.com:leeluna0476/libasm.git
cd libasm
make # output: libasm.a
mv attachment/libasm.h . # optional
vim main.c # write your own main
gcc main.c -lasm -L./
./a.out
```
