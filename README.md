# Backend project 
**API Rest**

## Run docker container
In order to build manually the image and run the container you must execute the following commands

1. Build the image based on the Dockerfile
```sh
docker build --tag <name:tag> .
```

2. Run container in detached mode and map his exposed his port (4000) 
```sh
docker run -d -p 4000:4000 --name <name> <image_name>
```

