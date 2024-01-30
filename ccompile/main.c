#include <stdio.h>
#include <stdlib.h>

#define ERROR(msg) {printf("Error: %s", msg); exit(-1);}

int main(int argc, const char* argv[])
{
	if(argc != 2)
	{
		ERROR("No name provided");
	}
	printf("Hello %s", argv[1]);
	exit(0);
}