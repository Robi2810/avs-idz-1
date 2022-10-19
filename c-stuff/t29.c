#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define ulli unsigned long long int

int main(int argc, char** argv) {
	if (argc < 3) {
		printf("Usage: ./main <input> <output>\n");
		return 0;
	}
	
	FILE *fp;
	ulli n;
	fp = fopen(argv[1], "r");
	fscanf(fp, "%llu", &n);

	int* arr = (int*)malloc(sizeof(int)*n);
	for (ulli i = 0; i < n; ++i) {
		fscanf(fp, "%d", &arr[i]);
	}

	fclose(fp);

	fp = fopen(argv[2], "w");

	int neg_idx = -1;
	for (ulli i = 0; i < n; ++i) {
		if (arr[i] < 0 && arr[i] % 2 == 0) {
			neg_idx = i;
			break;
		}
	}
	if (neg_idx == -1) {
		neg_idx = n - 1;
	}

	int* arrB = (int*)malloc(sizeof(int)*n);
	for (ulli i = 0; i < n; ++i) {
		arrB[i] = arr[i] * arr[neg_idx];
	}

	for (int i = 0; i < n; ++i) {
		fprintf(fp, "%d\n", arrB[i]);
	}
	printf("\n");
	free(arr);
	free(arrB);
	fclose(fp);
	return 0;
}
