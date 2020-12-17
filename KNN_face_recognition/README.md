## Make sure the dockerfile is present outside the examples folder

docker build -d face_recognition:latest .


 docker run -it \
    --name face_recognition \
    --privileged
    --device /dev/vchiq \
     face_recognition \
      /bin/bash

NOTE: The --priveleged flag gives the docker access to all the host resources
For using raspberry pi camera userland tool raspistill, docker host service /dev/vchiq need to be added to the container. 


Command to run for reduced CPU utilization by docker:
 docker run -it --cpu-period-=100000  --cpu-quota=50000 \
    --name face_recognition \
    --privileged
    --device /dev/vchiq \
     face_recognition \
      /bin/bash


--cpu-period i time during which container utilization is tracked.
--cpu-quota sets the total amount of CPU time that a container can use in a single cpu-period. 
Here, cpu-quota set to 50000 implies the the number of microseconds that container has access to cpu resources during a period of 100000
Thus,  the container is limited to only 50% of cpu resources affecting the response time of the dockerized application. 