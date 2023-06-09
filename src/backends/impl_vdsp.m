#import <Foundation/Foundation.h>
#import <Accelerate/Accelerate.h>
#import "accmath.h"

inline Vector2 Vector2Add(Vector2 v1, Vector2 v2) {
    float a[2] = {v1.x, v1.y};
    float b[2] = {v2.x, v2.y};
    float result[2];

    vDSP_vadd(a, 1, b, 1, result, 1, 2);

    Vector2 resultVector;
    resultVector.x = result[0];
    resultVector.y = result[1];

    return resultVector;
}

inline Vector2 Vector2Mul(Vector2 v1, Vector2 v2) {
    float a[2] = {v1.x, v1.y};
    float b[2] = {v2.x, v2.y};
    float result[2];

    vDSP_vmul(a, 1, b, 1, result, 1, 2);

    Vector2 resultVector;
    resultVector.x = result[0];
    resultVector.y = result[1];

    return resultVector;
}
