.text
.align 2
.globl _Vector2AddPtr
_Vector2AddPtr:
    // Load input vectors v1 and v2 into SIMD registers
    ldp q0, q1, [x0]
    ldp q2, q3, [x1]
    
    // Add the vectors using SIMD instructions
    fadd v4.4s, v0.4s, v2.4s   // Add the x components
    fadd v5.4s, v1.4s, v3.4s   // Add the y components
    
    // Store the result vector
    stp q4, q5, [x2]
    
    // Return
    ret


.globl _Vector2MulPtr
_Vector2MulPtr:
    // Load input vectors v1 and v2 into SIMD registers
    ldp q0, q1, [x0]
    ldp q2, q3, [x1]
    
    // Multiply the vectors using SIMD instructions
    fmul v4.4s, v0.4s, v2.4s   // Multiply the x components
    fmul v5.4s, v1.4s, v3.4s   // Multiply the y components
    
    // Store the result vector
    stp q4, q5, [x2]
    
    // Return
    ret
