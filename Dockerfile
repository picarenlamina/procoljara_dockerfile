#source https://dev.to/oneofthedevs/docker-angular-nginx-37e4
# source https://docs.docker.com/build/building/multi-stage/
### STAGE 1:BUILD ###
# Defining a node image to be used as giving it an alias of "build"
# Which version of Node image to use depends on project dependencies 
# This is needed to build and compile our code 
# while generating the docker image
# FROM node:alpine AS build
FROM node:22.14.0-alpine AS build
#instalacion git y actualizacion sistema
RUN apk update 
RUN apk add git


# Create a Virtual directory inside the docker image
WORKDIR /dist/src/app

# Copy files to virtual directory
# COPY package.json package-lock.json ./
# Run command in Virtual directory
RUN npm cache clean --force
# Copy files from local machine to virtual directory in docker image
# COPY . .

#clonacion de repositorio con aplicacion de symfony
RUN git clone https://github.com/picarenlamina/procoljara.git .


RUN npm install
RUN npm run build 


### STAGE 2:RUN ###
# Defining nginx image to be used
FROM nginx:latest AS ngi

# Copying compiled code 
COPY --from=build /dist/src/app/dist/upwind /usr/share/nginx/html

# Copia fichero configuracion nginx
COPY /nginx.conf  /etc/nginx/conf.d/default.conf

# Exposing  Port 80 while 
EXPOSE 80
