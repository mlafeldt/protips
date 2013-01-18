# Minimal C Unit Testing

In screencast #84 of Destroy All Software, [A bit of C](https://www.destroyallsoftware.com/screencasts/catalog/a-bit-of-c), Gary Bernhardt presents a very minimal approach to C unit testing that I'd like to share. In fact, all it takes are asserts and a `run_test` macro:

    #include <stdio.h>
    #include <assert.h>

    #define run_test(fn_name) \
        printf("%s\n", #fn_name); \
        fn_name()

    // Stupid sample tests
    void test_foo()
    {
        assert(1 < 2);
    }

    void test_bar()
    {
        assert(NULL == (void*)0);
    }

    int main(int argc, char *argv[])
    {
        run_test(test_foo);
        run_test(test_bar);
        printf("\nOK\n");
        return 0;
    }

Running this code gives us:

    $ gcc run_test.c -o run_test
    $ ./run_test 
    test_foo
    test_bar

    OK

_Published on [Coderwall](https://coderwall.com/p/hytjcq) on 2013-01-14_
