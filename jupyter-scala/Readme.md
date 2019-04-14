## About
???

## Running
For running container on base the image you need to perform next script.
```bash
docker run -it \
    -p 8888:8888 \
    -v /home/your_user/scala_norebook.ipynb:/workspace/scala_norebook.ipynb \
    entony/jupyter-scala
```

## Versions description
### 1.4.1
The version contains
* Java 8
* Python 3.7
* Notebook server 5.7.8
* Tornado 5.1.1
* NumPy 1.16.2
* Pandas 0.24.2
* BeakerX 1.4.1

## References
Docker image: https://hub.docker.com/r/entony/jupyter-scala
