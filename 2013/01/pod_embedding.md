# Embedding POD with different programming languages

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

## Python

    POD = """
    
    =head1 NAME
    
    ...
    
    =cut
    
    """

## Shell

    :<<POD
    
    =head1 NAME
    
    ...
    
    =cut
    
    POD
