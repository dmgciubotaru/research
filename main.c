#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define ERROR(msg) {printf("Error: %s", msg); exit(-1);}


const char *name = "Anonimus";

int main(int argc, const char* argv[])
{
	int len;

	if(argc != 2)
	{
		ERROR("No name provided");
	}
	name = argv[1];
	len = strlen(name);
	printf("Hello %s", name);
	exit(0);
}