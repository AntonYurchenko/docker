## About
You can use the docker image as base image for projects on scala.

## Running
For running container on base the image you need to add devices and some libraries to your container.
```bash
docker run -d \
    --device /dev/nvidia0:/dev/nvidia0 \
    --device /dev/nvidia1:/dev/nvidia1 \
    --device /dev/nvidia2:/dev/nvidia2 \
    --device /dev/nvidiactl:/dev/nvidiactl \
    --device /dev/nvidia-uvm:/dev/nvidia-uvm \
    -v /usr/lib/x86_64-linux-gnu/libcuda.so.1:/usr/local/cuda-9.0/targets/x86_64-linux/lib/stubs/libcuda.so.1:ro \
    -v /usr/lib/nvidia-396/libnvidia-fatbinaryloader.so.396.54:/usr/local/cuda-9.0/targets/x86_64-linux/lib/stubs/libnvidia-fatbinaryloader.so.396.54:ro \
    entony/scala-mxnet-cuda-cudnn:2.12-1.3.1-9-7-builder
```

## Versions description
### 2.12-1.3.1-9-7-runtime
The version contains
* CUDA 9
* CUDNN 7
* Linux timezone utils
* Java 8
* MXNet library version 1.3.1. The library has been built on scala 2.12 (with out spark-ml model). Path to jar file is `/usr/local/share/mxnet/scala/linux-x86_64-gpu/mxnet-full_2.12-linux-x86_64-gpu-1.3.1-SNAPSHOT.jar`
* OpenCV libraries version 3.4.3. Path to libopencv_java343.so is: `/usr/local/share/OpenCV/java/libopencv_java343.so`, and path to jar file is: `/usr/local/share/OpenCV/java/opencv-343.jar`

### 2.12-1.3.1-9-7-builder
The version contains all included in version 2.12-1.3.1-9-7-runtime and:
* Scala 2.12.7
* Sbt 1.2.6

## References
Docker image: https://hub.docker.com/r/entony/scala-mxnet-cuda-cudnn
