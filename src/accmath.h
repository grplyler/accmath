#ifndef MATH_ABSTRACTION_H
#define MATH_ABSTRACTION_H

#ifdef BACKEND_SIMD
    // Code specific to SIMD backend
    #define ACCMATH_BACKEND "SIMD"

#elif defined(BACKEND_VDSP)
    // Code specific to vDSP backend
    #define ACCMATH_BACKEND "vDSP"

#elif defined(BACKEND_DEFAULT)
    // Code specific to default backend
    #define ACCMATH_BACKEND "DEFAULT"

#elif defined(BACKEND_ASM1)
    // Code specific to default backend
    #define ACCMATH_BACKEND "ASM1"

#elif defined(BACKEND_ASM2)
    // Code specific to default backend
    #define ACCMATH_BACKEND "ASM2"
#else
    // Default code for other cases
#endif


typedef struct {
    float x;
    float y;
} Vector2;


Vector2 Vector2Add(Vector2 v1, Vector2 v2);
Vector2 Vector2Mul(Vector2 v1, Vector2 v2);

// ARM64 ASM
void Vector2AddPtr(Vector2 *v1, Vector2 *v2, Vector2 *v3);
void Vector2MulPtr(Vector2 *v1, Vector2 *v2, Vector2 *v3);

#endif