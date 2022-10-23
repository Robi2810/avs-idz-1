#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <time.h>
#include <string.h>

#define ulli unsigned long long int

int main(int argc, char** argv) {
	if (argc < 3) {
		printf("Usage: ./main <input> <output>\n");
		return 0;
	}
	FILE *fp;
	ulli n;
	int* arr;
	int idx = 2;
	clock_t start_read, end_read, start_calc, end_calc, start_write, end_write;
	start_read = clock();
	if (strcmp(argv[1], "-r")) {
		fp = fopen(argv[1], "r");
		fscanf(fp, "%llu", &n);
		arr = (int*)malloc(sizeof(int)*n);
		for (ulli i = 0; i < n; ++i) {
			fscanf(fp, "%d", &arr[i]);
		}

		fclose(fp);
	} else {
		n = atoll(argv[2]);
		int lower_bound = atoi(argv[3]);
		int upper_bound = atoi(argv[4]);
		idx = 5;
		arr = (int*)malloc(sizeof(int)*n);
		srand(time(NULL));
		for (ulli i = 0; i < n; ++i) {
			arr[i] = (rand() % (upper_bound - lower_bound)) + lower_bound;
			printf("%d ", arr[i]);
		}
		printf("\n");
	}
	end_read = clock() - start_read;
	
	fp = fopen(argv[idx], "w");
	if (fp == NULL) {
		printf("Wrong fname\n");
		free(arr);
		return 0;
	}
	start_calc = clock();
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
	end_calc = clock() - start_calc;
	start_write = clock();
	for (ulli i = 0; i < n; ++i) {
		fprintf(fp, "%d\n", arrB[i]);
	}
	end_write = clock() - start_write;
	free(arr);
	free(arrB);
	fclose(fp);
	double time_read = ((double)end_read)/CLOCKS_PER_SEC;
	double time_calc = ((double)end_calc)/CLOCKS_PER_SEC;
	double time_write = ((double)end_write)/CLOCKS_PER_SEC;
	printf("Elapsed time:\n");
	printf("Read:\t\t%f\n", time_read);
	printf("Calculations:\t%f\n", time_calc);
	printf("Write:\t\t%f\n", time_write);
	return 0;
}
