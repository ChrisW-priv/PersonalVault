```C++
#include <CL/cl.h>

#define ARRAY_SIZE 100000

int main() {
  // Create an OpenCL context and other necessary objects
  cl_context context;
  cl_command_queue queue;
  cl_device_id device;
  // Initialize the context, queue, and device...

  // Create the array to store the result
  float result[ARRAY_SIZE];

  // Create a compute program from the source code
  const char* source = "__kernel void compute(__global float* result, float scalar) {\n"
                       "  int gid = get_global_id(0);\n"
                       "  result[gid] = scalar + gid;\n"
                       "}\n";
  cl_program program = clCreateProgramWithSource(context, 1, &source, NULL, NULL);
  clBuildProgram(program, 0, NULL, NULL, NULL, NULL);

  // Create a compute kernel from the program
  cl_kernel kernel = clCreateKernel(program, "compute", NULL);

  // Set the kernel arguments
  clSetKernelArg(kernel, 0, sizeof(cl_mem), &result);
  clSetKernelArg(kernel, 1, sizeof(float), &scalar);

  // Create a command queue to hold the commands for the computation
  cl_command_queue cmdQueue = clCreateCommandQueue(context, device, 0, NULL);

  // Enqueue the kernel for execution
  size_t globalSize = ARRAY_SIZE;
  for (int i = 0; i < 10; i++) {
    // Set the scalar value for the current iteration
    float scalar = 1.0f;

    // Enqueue the kernel for execution
    clEnqueueNDRangeKernel(cmdQueue, kernel, 1, NULL, &globalSize, NULL, 0, NULL, NULL);
  }

  // Read the result from the device
  clEnqueueReadBuffer(cmdQueue, result, CL_TRUE, 0, sizeof(result), result, 0, NULL, NULL);

  // Clean up the resources
  clReleaseMemObject(result);
  clReleaseKernel(kernel);
  clReleaseProgram(program);
  clReleaseCommandQueue(cmdQueue);
  clReleaseContext(context);

  return 0;
}
```

This program creates a buffer and does some computation on it. In general [OpenCL](OpenCL) is used as a high level API for [graphics programming](graphics%20programming).
