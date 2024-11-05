(**************************************************************************)
(*  Mini, a type inference engine based on constraint solving.            *)
(*  Copyright (C) 2006. Fran�ois Pottier, Yann R�gis-Gianas               *)
(*  and Didier R�my.                                                      *)
(*                                                                        *)
(*  This program is free software; you can redistribute it and/or modify  *)
(*  it under the terms of the GNU General Public License as published by  *)
(*  the Free Software Foundation; version 2 of the License.               *)
(*                                                                        *)
(*  This program is distributed in the hope that it will be useful, but   *)
(*  WITHOUT ANY WARRANTY; without even the implied warranty of            *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU     *)
(*  General Public License for more details.                              *)
(*                                                                        *)
(*  You should have received a copy of the GNU General Public License     *)
(*  along with this program; if not, write to the Free Software           *)
(*  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA         *)
(*  02110-1301 USA                                                        *)
(*                                                                        *)
(**************************************************************************)

(* $Id: miniSyntacticAnalysis.mli 421 2006-12-22 09:27:42Z regisgia $ *)

(** This module provides a parser for program and a parser for constraint. *)

(** Parse a program given as string. *)
val parse_program_from_string : string -> MiniAst.program

(** Parse a constraint given as a string. *)
val parse_constraint_from_string : string -> Constraint.tconstraint

(**/**)

val register_tasks : unit -> unit
val parse_program_task : Processing.task_name
val parse_constraint_task : Processing.task_name
