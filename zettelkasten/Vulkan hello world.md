```c++
#include <vulkan/vulkan.h>
#include <stdio.h>

int main()
{
    // create the Vulkan instance
    VkInstance instance;
    VkApplicationInfo appInfo = {};
    appInfo.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
    appInfo.pApplicationName = "Hello World";
    appInfo.applicationVersion = VK_MAKE_VERSION(1, 0, 0);
    appInfo.pEngineName = "My Engine";
    appInfo.engineVersion = VK_MAKE_VERSION(1, 0, 0);
    appInfo.apiVersion = VK_API_VERSION_1_0;
    VkInstanceCreateInfo instanceCreateInfo = {};
    instanceCreateInfo.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    instanceCreateInfo.pApplicationInfo = &appInfo;
    VkResult result = vkCreateInstance(&instanceCreateInfo, NULL, &instance);
    if (result != VK_SUCCESS)
    {
        printf("Failed to create Vulkan instance: %d\n", result);
        return 1;
    }

    // print a message to the console
    printf("Hello, World!\n");

    // clean up the Vulkan instance
    vkDestroyInstance(instance, NULL);

    return 0;
}
```

This program creates a [[Vulkan instance]], which is the starting point for any [[Vulkan application]], and then prints a "hello world" message to the console. The program also includes some basic error checking to ensure that the Vulkan instance was created successfully.

Note that this is just a simple example to illustrate the basics of [[Vulkan]] programming. A real-world Vulkan application would typically include additional code to create a logical device, allocate memory and resources, create pipelines and shaders, and submit commands to a queue. These concepts are covered in more detail in the official Vulkan tutorials and other resources.