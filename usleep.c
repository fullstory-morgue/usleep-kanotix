#include <stdio.h>

int main(int argc, char **argv)
{
	unsigned long ut;
	if(argc<2||(ut=atol(argv[1]))<=0)
	{
		fprintf(stderr, "Usage: %s useconds\n", argv[0]);
		return 1;
	}
	else usleep(ut);

	return 0;
}

