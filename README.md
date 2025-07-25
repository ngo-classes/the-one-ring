# The One Ring framework

This is the aggregarion of all other research and education containerized environments. Using multiple Docker compose files, this framework aims to 
provide users with a dynamic setup that can be quickly extended based on their own teach/learning/researching progress. 

### Warning

- If you clone into a Windows environment, makes sure that your git is set to keep `LF`:

~~~
git config --global core.autocrlf false
git clone https://github.com/ngo-classes/the-one-ring
~~~

### Building the base images

- You should build the images in the following order:
- Build the specific bases depending on your courses need:

- CSC331

~~~
docker compose -f docker-compose.bases.yml build csc331base --no-cache
~~~

- CSC467

~~~
docker compose -f docker-compose.bases.yml build csc467base --no-cache
~~~

### CSC331: Operating System

- If you are an instructor with lecture nodes and grading, build `head-instructor`:

~~~
docker compose -f docker-compose.csc331.yml build 331-instructor --no-cache
docker compose -f docker-compose.csc331.yml up 331-instructor -d
~~~

- Otherwise, build `head-student`:

~~~
docker compose -f docker-compose.csc331.yml build 331-student --no-cache
docker compose -f docker-compose.csc331.yml up 331-student -d
~~~

### CSC467: Big Data Engineering

- If you are an instructor with lecture nodes and grading, build `467-instructor`:

~~~
docker compose -f docker-compose.csc467.yml build 467-instructor --no-cache
docker compose -f docker-compose.csc467.yml up 467-instructor -d
~~~

- Otherwise, build `467-student`:

~~~
docker compose -f docker-compose.csc467.yml build 467-student --no-cache
docker compose -f docker-compose.csc467.yml up 467-student -d
~~~

- Launch the worker nodes:

~~~
docker compose -f docker-compose.csc467.yml up 467-worker -d --scale 467-worker=4
~~~


### CSC46: Distributed and Parallel Computing

- Prior to launching, check `docker-compose.yml` to adjust the `resources` sections of the services being launched. 
    - It is possible to launch more than two compute nodes (or launch with just one node) by creating additional copy of the `compute-01` service section. You can create the new `compute-xx` service sections and make sure that the `hostname` and `container_name` sections for the new services are changed accordingly. 
- If you are an instructor with lecture nodes and grading, build and launch `466-instructor`:

~~~
docker compose -f docker-compose.csc466.yml build 466-instructor --no-cache
docker compose -f docker-compose.csc466.yml up 466-instructor -d
~~~

- Otherwise, build and launch `466-student`:

~~~
docker compose -f docker-compose.csc466.yml build 466-student --no-cache
docker compose -f docker-compose.csc466.yml up 466-student -d
~~~

- Launch the compute nodes
~~~
docker compose -f docker-compose.csc466.yml up compute01 -d
docker compose -f docker-compose.csc466.yml up compute02 -d
~~~

### Test

- Access the VSCode server via http://127.0.0.1:18088/
    - Password is **goldenrams** 
- Open a terminal
- Test the environment as follows:

~~~
mpicc -o hello mpi_hello_world.c 
mpirun --host compute01:2,compute02:2 -np 4 ./hello
~~~


After this is done, update `.gitignore` so that temporary files generated in home are not included. 

### Build mkdocs server (for instructor)

`mkdocs serve --dirty --dev-addr=0.0.0.0:8000` to support external view of mkdocs
