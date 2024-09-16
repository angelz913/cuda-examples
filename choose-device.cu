#include <iostream>

int main() {
    // Get the ID of the current CUDA device.
    int dev;
    cudaGetDevice(&dev);
    printf("%d\n", dev);

    // Get the properties.
    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, dev);
    printf("%d.%d\n", prop.major, prop.minor);

    // Choose a CUDA device with certian properties.
    memset(&prop, 0, sizeof(cudaDeviceProp));
    prop.major = 7;
    prop.minor = 5;
    cudaChooseDevice(&dev, &prop);
    printf("%d\n", dev);

    cudaSetDevice(dev);
}