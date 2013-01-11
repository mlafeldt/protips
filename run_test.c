// Based on https://www.destroyallsoftware.com/screencasts/catalog/a-bit-of-c

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
