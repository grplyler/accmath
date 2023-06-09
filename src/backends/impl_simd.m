#import <Foundation/Foundation.h>
#import <Accelerate/Accelerate.h>
#import <simd/simd.h>
#import "accmath.h"

inline Vector2 Vector2Add(Vector2 v1, Vector2 v2) {
    simd_float2 simdV1 = {v1.x, v1.y};
    simd_float2 simdV2 = {v2.x, v2.y};
    simd_float2 simdResult = simdV1 + simdV2;

    Vector2 result;
    result.x = simdResult.x;
    result.y = simdResult.y;

    return result;
}

inline Vector2 Vector2Mul(Vector2 v1, Vector2 v2) {
    simd_float2 simdV1 = {v1.x, v1.y};
    simd_float2 simdV2 = {v2.x, v2.y};
    simd_float2 simdResult = simdV1 * simdV2;

    Vector2 result;
    result.x = simdResult.x;
    result.y = simdResult.y;

    return result;
}
