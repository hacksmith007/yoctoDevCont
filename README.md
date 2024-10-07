## File Tree : 
├── yocto      Clone Poky in this directory : git clone git://git.yoctoproject.org/poky      
    └── poky           
       ├── bitbake    
       ├── build   
       ├── contrib   
     ├── documentation   
 
Build Image : docker build -t <image_name> .
Run : docker run -d --privileged --mount type=bind,source=/home/rahul/yocto,target=/workspaces/yocto <image_name>
Access container : docker exec -it <container_id/name> /bin/bash
      
