#include <iostream>

// The __global qualifier specifies a function to be compiled to run
// on a device.
__global__ void kernel(void) {}

int main() {
    // The angle brackets denote arguments to pass to the runtime system.
    kernel<<<1,1>>>();
    return 0;
}