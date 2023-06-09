#include "accmath.h"

inline Vector2 Vector2Add(Vector2 v1, Vector2 v2) {
    Vector2 result;
    result.x = v1.x + v2.x;
    result.y = v1.y + v2.y;
    return result;
}

inline Vector2 Vector2Mul(Vector2 v1, Vector2 v2) {
    Vector2 result;
    result.x = v1.x * v2.x;
    result.y = v1.y * v2.y;
    return result;
}
