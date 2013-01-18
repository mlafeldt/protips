# How the Shebang is processed by the Linux kernel

This is the rather complicated C code that parses the shebang (`#!`) line at the start of a script and then executes it using the provided interpreter:

http://lxr.linux.no/linux+*/fs/binfmt_script.c

Many people don't know that this is actually done in the kernel. You can also see why passing multiple arguments to the interpreter will never work.

_Published on [Coderwall](https://coderwall.com/p/pdg77q) on 2013-01-17_
