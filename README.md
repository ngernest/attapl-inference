# ATTAPL Type Inference Engine

This repo contains François Pottier's [prototype implementation of a type 
inference engine](http://cristal.inria.fr/attapl/), which accompanies the chapter "The Essence of ML Type Inference" in [ATTAPL](https://www.cis.upenn.edu/~bcpierce/attapl/).

The original authors of the code are François Pottier, Yann Régis-Gianas and Didier Rémy.    
(I have lightly modified the code so that it works with Dune & the latest version of OCaml.)

## Compilation instructions
- To compile, run `dune build`
- To run the executable, run `dune exec -- main`


## Usage

A basic usage of mini is to provide a source file as input. Let's
`foo.ml` be this file:

```ocaml
let id x = x
``` 

Then, `dune exec -- main foo.ml` returns 
```ocaml
val id: forall a. a -> a
```

The documentation of the module `MiniAst` explains the concrete syntax
of the Mini language. The `tests` subdirectory contains examples of
valid Mini programs.

## Options

By default, [mini] processes the following tasks:

- parse-program, parse the input file as a Mini program
- generate-constraint, generate the typing constraint of this program
-  solve-constraint, solve this constraint
- print-env, print the types of the toplevel definitions


These tasks are optional:

-  print-program, pretty-print the parsed program
-  parse-constraint, parse the input file as a typing constraint not as 
   a Mini program
-  print-constraint, print the typing constraint

The options of [dune exec -- main] enable the use of these optional tasks:

usage: dune exec -- main [options] filename
  --start taskname             Task to begin with
  --end taskname               Task to end with
  --trace-all                  Trace
  --do taskname                Do a task
  --trace-solve-constraint     Trace solve-constraint
  --trace-print-program        Trace print-program
  --trace-generate-constraint  Trace generate-constraint
  --trace-print-constraint     Trace print-constraint
  --trace-parse-program        Trace parse-program
  --trace-print-env            Trace print-env
  --trace-parse-constraint     Trace parse-constraint
  -help                        Display this list of options
  --help                       Display this list of options

