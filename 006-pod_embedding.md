# Embedding POD with different programming languages

POD, the [Plain Old Documentation](http://perldoc.perl.org/perlpod.html) format, is a lightweight markup language that was originally created for documenting Perl code. Translator tools can convert the POD data to different formats like plain text (`pod2text`), HTML (`pod2html`), or manpages (`pod2man`). I've used POD extensively in the past to document my command-line tools.

Fortunately, POD is by no means restricted to the Perl world. As long as you can find a way to embed POD into your code, you can use it pretty much anywhere.

Here are a few language examples, starting with the obvious one:

## Perl

    =pod

    =head1 NAME

    ...

    =cut

    or:

    __END__

    =head1 NAME

    ...

## C

    /*

    =head1 NAME

    ...

    =cut

    */

## Shell

    :<<POD

    =head1 NAME

    ...

    =cut

    POD

## Python

    POD = """

    =head1 NAME

    ...

    =cut

    """

## Ruby

    __END__

    =head1 NAME

    ...

_Published on [Coderwall](https://coderwall.com/p/cuho3w) on 2013-01-09_
