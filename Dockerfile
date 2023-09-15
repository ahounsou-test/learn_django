# base image  
FROM python:3.11-slim
# setup environment variable  
ENV DockerHOME=/home/app/webapp  

# RUN apt-get update &&   apt-get upgrade -y
# set work directory  
RUN mkdir -p $DockerHOME  



# where your code lives  
WORKDIR $DockerHOME  

# set environment variables  
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1  

# install dependencies  
RUN python -m pip install --upgrade pip  
RUN python -m pip install --upgrade setuptools

# copy whole project to your docker home directory. 
COPY . $DockerHOME  
# run this command to install all dependencies  
RUN python -m  pip install -r requirements.txt  
# port where the Django app runs  
EXPOSE 8000  
# start server  
CMD python mysite/manage.py runserver  