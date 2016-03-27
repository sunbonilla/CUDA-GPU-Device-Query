#include <stdio.h>
/* Print info about connected Nvidia GPUs */
void query_GPUs() {
    int nDevices;
    cudaGetDeviceCount(&nDevices);
    for (int i = 0; i < nDevices; i++) {
        cudaDeviceProp prop;
        cudaGetDeviceProperties(&prop, i);
        printf("Device Number: %d\n", i);
        printf("  Device name: %s\n", prop.name);
        printf("  Major revision number: %d\n", prop.major);
        printf("  Minor revision number: %d\n", prop.minor);
        printf(  "Total shared memory per block: %u\n",  devProp.sharedMemPerBlock);
        printf("  Total registers per block: %d\n",  devProp.regsPerBlock);
        printf(  "Warp size: %d\n",  devProp.warpSize);
        printf("  Maximum memory pitch: %u\n",  devProp.memPitch);
        printf("  Maximum threads per block: %d\n",  devProp.maxThreadsPerBlock);
        printf("  Clock rate (KHz): %d\n",  devProp.clockRate);
        printf("  Memory Clock Rate (KHz): %d\n", prop.memoryClockRate);
        printf("  Memory Bus Width (bits): %d\n", prop.memoryBusWidth);
        printf("  Total VRAM (Bytes): %u\n",  prop.totalGlobalMem);
        printf("  Total constant memory (Bytes): %u\n",  devProp.totalConstMem);
        printf("  Number of SMs: %d\n", prop.multiProcessorCount);
        printf("  Peak Memory Bandwidth (GB/s): %f\n",
           2.0*prop.memoryClockRate*(prop.memoryBusWidth/8)/1.0e6);
        printf("  Kernel execution timeout: %s\n",  (prop.kernelExecTimeoutEnabled ? "Yes" : "No"));
        printf("  Concurrent copy and execution: %s\n",  (devProp.deviceOverlap ? "Yes" : "No"));
        printf("  Concurrent kernels: %s\n",  (prop.concurrentKernels ? "Yes" : "No"));
    }

}

int main(int argc, char ** argv) {

    query_GPUs();

    return 0;
}
