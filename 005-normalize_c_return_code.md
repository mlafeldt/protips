# Normalize return code to 0 or 1 in C

In C, a more idiomatic way to say

`return errors ? 1 : 0`

is

`return !!errors`

But please do not encrypt your return codes further.

_Published on [Coderwall](https://coderwall.com/p/eyfugq) on 2013-01-08_
