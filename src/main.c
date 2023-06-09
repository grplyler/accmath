#include <stdio.h>
#include <time.h>
#include "accmath.h"

#define NUM_ITERATIONS 10000000

int main() {
    Vector2 v1 = {1.0f, 2.0f};
    Vector2 v2 = {3.0f, 4.0f};
    Vector2 result;

    printf("Using backend: %s\n", ACCMATH_BACKEND);
    printf("Running for %d iterations\n", NUM_ITERATIONS);

    // Benchmark ASM backend. Use pointers
    clock_t start = clock();
    for (int i = 0; i < NUM_ITERATIONS; i++) {
        Vector2AddPtr(&v1, &v2, &result);
    }
    result.x = result.x + 1.0f;
    clock_t end = clock();
    double elapsed = (double)(end - start) / CLOCKS_PER_SEC;
    printf("V2 Add: %.3f seconds\n", elapsed);

    // Benchmark ASM Vector2 Multiply
    start = clock();
    for (int i = 0; i < NUM_ITERATIONS; i++) {
        Vector2MulPtr(&v1, &v2, &result);
    }
    result.x = result.x + 1.0f;
    end = clock();
    elapsed = (double)(end - start) / CLOCKS_PER_SEC;
    printf("V2 Mul: %.3f seconds\n", elapsed);

    
    // // Benchmarking SIMD backend
    // clock_t start = clock();
    // for (int i = 0; i < NUM_ITERATIONS; i++) {
    //     result = Vector2Add(v1, v2);
    // }
    // result.x = result.x + 1.0f;
    // clock_t end = clock();
    // double elapsed = (double)(end - start) / CLOCKS_PER_SEC;
    // printf("V2 Add: %.3f seconds\n", elapsed);

    // // Benchmark Vector2 Multiply
    // start = clock();
    // for (int i = 0; i < NUM_ITERATIONS; i++) {
    //     result = Vector2Mul(v1, v2);
    // }
    // result.x = result.x + 1.0f;
    // end = clock();
    // elapsed = (double)(end - start) / CLOCKS_PER_SEC;
    // printf("V2 Mul: %.3f seconds\n", elapsed);


    return 0;
}
