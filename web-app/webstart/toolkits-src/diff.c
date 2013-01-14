#include <stdio.h>
#include <conio.h>
	
int main(int argc, char *argv[]) {
	int i;
	FILE *fp1, *fp2;
	int c1, c2;
	
	if (argc != 3) {
		printf("error: need 2 arguments\n");
		return(-1);
	}
	
	char *file1 = argv[1];
	char *file2 = argv[2];

	fp1 = fopen(file1, "r");
	fp2 = fopen(file2, "r");
	
	if (fp1==NULL) {
		printf("error: %s not found.\n", file1);
		return(-1);
	}
	if (fp2==NULL) {
		printf("error: %s not found.\n", file2);
		return(-1);
	}
	
	while (!feof(fp1)) {
		if (feof(fp2)) {
			printf("error: termination not expected.\n", c1);
			return(-1);
		}
		c1 = fgetc(fp1);
		c2 = fgetc(fp2);
		
		if (c1 != -1) {
			printf("%c", c1);
			
			if (c1 != c2) {
				printf("^\n");
				printf("error: ASCII %d, %d not match.\n", c1, c2);
				return(-1);
			}
		}
	}
	
	fclose(fp1);
	fclose(fp2);

	return 0;
}

