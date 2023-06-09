.text
.align 4
.globl _Vector2AddPtr
_Vector2AddPtr:
    // Load input vectors v1 and v2 into SIMD registers with aligned addresses
    ldp q0, q1, [x0, #0]
    ldp q2, q3, [x1, #0]
    
    // Add the vectors using FMA instructions
    fmla v4.4s, v0.4s, v2.4s   // Fused multiply-add the x components
    fmla v5.4s, v1.4s, v3.4s   // Fused multiply-add the y components
    
    // Store the result vector with aligned address
    stp q4, q5, [x2, #0]
    
    // Return
    ret


.globl _Vector2MulPtr
_Vector2MulPtr:
    // Load input vectors v1 and v2 into SIMD registers with aligned addresses
    ldp q0, q1, [x0, #0]
    ldp q2, q3, [x1, #0]
    
    // Multiply the vectors using FMA instructions
    fmul v4.4s, v0.4s, v2.4s   // Multiply the x components
    fmul v5.4s, v1.4s, v3.4s   // Multiply the y components
    
    // Store the result vector with aligned address
    stp q4, q5, [x2, #0]
    
    // Return
    ret
