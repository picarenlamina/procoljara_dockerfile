FROM node:alpine

#instalacion git y actualizacion sistema
RUN apt-get update && apt-get install -y git 

WORKDIR /usr/src/app

#clonacion de repositorio con aplicacion de symfony
RUN git clone https://github.com/picarenlamina/procoljara.git .

#COPY . /usr/src/app

RUN npm install -g @angular/cli

RUN npm i

RUN ng build

CMD ["ng", "serve", "--host", "0.0.0.0"]
