# Basic TDD with SML

I'm currently taking the [Programming Languages](https://www.coursera.org/course/proglang) course on Coursera. In the first homework assignment, you have to write 11 SML functions related to calendar dates. I thought it would be interesting to share how I've tested those functions.

Let's assume the actual code lives in `hw1.sml` and the tests in `hw1_test.sml`. The files look like this:

`hw1.sml`

```
fun is_older(date1: int*int*int, date2: int*int*int) =
  (* implementation *)

fun number_in_month(dates: (int*int*int) list, month: int) =
  (* implementation *)

(* etc. *)
```

`hw1_test.sml`

```
(* Test is_older *)
val test_is_older_1 = is_older((2012,1,1), (2012,1,1)) = false
val test_is_older_2 = is_older((2012,1,1), (2013,1,1)) = true
val test_is_older_3 = is_older((2013,1,1), (2013,2,1)) = true
val test_is_older_4 = is_older((2013,1,1), (2013,1,2)) = true

(* Test number_in_month etc. *)
```

Now you can run the tests this way:

```sh
$ cat hw1.sml hw1_test.sml | sml
Standard ML of New Jersey v110.74 [built: Fri Dec  7 10:09:50 2012]
...
val is_older = fn : (int * int * int) * (int * int * int) -> bool
val number_in_month = fn : (int * int * int) list * int -> int
...
val test_is_older_1 = true : bool
val test_is_older_2 = true : bool
val test_is_older_3 = true : bool
val test_is_older_4 = true : bool
...
```

All passing tests should evaluate to _true_; all failing tests to _false_. (You can grep the output for failing tests.)

Based on this, I've written all SML functions in a [TDD](http://en.wikipedia.org/wiki/Test-driven_development) manner using Vim and this Vim key binding:

    :map ,t :w\|!cat hw1.sml hw1_test.sml \| sml<CR>

With it, press `,` + `t` and Vim will save your current file and run all tests, resulting in a fast feedback loop.

_Published on [Coderwall](https://coderwall.com/p/xxx) on 2013-01-24_
