#include <iostream>

__global__ void add(int a, int b, int *sum) {
    *sum = a + b;
}

int main() {
    int a = 5;
    int b = 10;
    int sum;
    int *dev_sum;
    // Allocate memory on device.
    cudaMalloc((void**)&dev_sum, sizeof(int));
    add<<<1,1>>>(5, 10, dev_sum);
    // Access memory on a device from host code.
    cudaMemcpy(&sum, dev_sum, sizeof(int), cudaMemcpyDeviceToHost);
    printf("%d + %d = %d\n", a, b, sum);
    // Free memory on device.
    cudaFree(dev_sum);
    return 0;
}