FROM node:alpine

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/picarenlamina/procoljara.git

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN npm install -g @angular/cli

RUN npm install

CMD ["ng", "serve", "--host", "0.0.0.0"]
