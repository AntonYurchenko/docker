# Description of the docker images

## scala-mxnet-cuda-cudnn
Image for microservices written on scala with using framework mxnet

### Building and deploy
```bash
git clone git@github.com:AntonYurchenko/docker.git docker
cd docker

# Runtime image
docker build --no-cache -f scala-mxnet-cuda-cudnn/Dockerfile.2.12-1.3.1-9-7-runtime -t entony/scala-mxnet-cuda-cudnn:2.12-1.3.1-9-7-runtime .
docker push entony/scala-mxnet-cuda-cudnn:2.12-1.3.1-9-7-runtime

# Builder image
docker build --no-cache -f scala-mxnet-cuda-cudnn/Dockerfile.2.12-1.3.1-9-7-builder -t entony/scala-mxnet-cuda-cudnn:2.12-1.3.1-9-7-builder .
docker push entony/scala-mxnet-cuda-cudnn:2.12-1.3.1-9-7-builder
```

## jupyter-scala
The image contains Jupyter Notebook with support scala programming language

### Building and deploy
```bash
git clone git@github.com:AntonYurchenko/docker.git docker
cd docker

docker build --no-cache -f jupyter-scala/Dockerfile -t entony/jupyter-scala:1.4.1 .
docker push entony/jupyter-scala:1.4.1
```
