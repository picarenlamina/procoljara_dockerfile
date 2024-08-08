# source https://dev.to/rodrigokamada/creating-and-running-an-angular-application-in-a-docker-container-40mk
FROM node:alpine

#instalacion git y actualizacion sistema
RUN apk update 
RUN apk add git

WORKDIR /usr/src/app

#clonacion de repositorio con aplicacion de symfony
RUN git clone https://github.com/picarenlamina/procoljara.git .

#COPY . /usr/src/app

RUN npm install -g @angular/cli

RUN npm install

#RUN ng build

# --host host to listen --port port to listen default 4200
CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "80"]

EXPOSE 80
