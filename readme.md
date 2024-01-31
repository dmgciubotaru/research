# Header

Code:
```
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
```

## Subheader Header
Introduction
C's efficiency and closeness to hardware make it pivotal in systems and application development. This article guides you through the C compilation process, crucial for transforming code into executable programs. Designed for both beginners and experienced developers, it enhances understanding of C programming. 

You can follow along with the examples or read for insight, with active engagement recommended for better learning. Prerequisites include a Linux machine, and examples utilize files from this GitHub repository.

Overview of the C Compilation Process
The C compilation process transforms human-readable code into an executable program through a series of stages, each crucial for preparing the code to run on the target machine. Here's a brief overview of each phase:
Preprocessing: Resolves directives like #include and #define, preparing the source code for compilation.
Compilation: Converts preprocessed code into assembly language, translating high-level constructs into a lower-level format.
Assembly: Transforms assembly code into machine code, producing object files with binary code that the processor can understand.
Linking: Combines object files and libraries into a single executable file, resolving references to create a standalone program.
We will use this C source file available in GitHub to walk through each step of the compilation process. This file is carefully chosen to illustrate how the compiler processes various C language elements, providing a practical lens through which to explore the transition from source code to an executable.
