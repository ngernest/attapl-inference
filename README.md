# ATTAPL Type Inference Engine

This repo contains François Pottier's [prototype implementation of a type 
inference engine](http://cristal.inria.fr/attapl/), which accompanies Pottier & Rémy's chapter "The Essence of ML Type Inference" in [ATTAPL](https://www.cis.upenn.edu/~bcpierce/attapl/).

The original authors of the code are François Pottier, Yann Régis-Gianas and Didier Rémy.    
(I have lightly modified the code so that it works with Dune & the latest version of the OCaml standard library.)

[**Docs**](https://yrg.gitlab.io/homepage/static/public/mini/) can be found on Yann Régis-Gianas's webpage.


## Compilation instructions
- To compile, run `dune build`
- To run the executable, run `dune exec -- main`

## Usage

A basic usage of mini is to provide a source file as input. Suppose
`foo.ml` contains the following:

```ocaml
let id x = x
``` 

Then, if we run `dune exec -- main foo.ml`, the following inferred type is displayed in `stdout`:  
```ocaml
val id: forall a. a -> a
```

The documentation of the module `MiniAst` explains the concrete syntax
of the Mini language. The `tests` subdirectory contains examples of
valid Mini programs.

## Options

By default, the executable (triggered by `dune exec -- main`) processes the following tasks:

- `parse-program`: parses the input file as a Mini program
- `generate-constraint`: generates the typing constraint of this program
- `solve-constraint`: solves a constraint
- `print-env`: print the types of the toplevel definitions


These tasks are optional:

-  `print-program`: pretty-prints the parsed program
-  `parse-constraint`: parses the input file as a typing constraint not as 
   a Mini program
-  `print-constraint`: prints a typing constraint

The other command-line flags enable the use of the following optional tasks:

```bash
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
```
