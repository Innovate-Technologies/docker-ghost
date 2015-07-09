FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y install wget unzip nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN mkdir /usr/local/ghost
RUN cd /usr/local/ghost
RUN wget https://ghost.org/zip/ghost-0.6.4.zip
RUN unzip ghost-0.6.4.zip
RUN rm -f ghost-0.6.4.zip
RUN npm install --production
RUN sed -i 's/2368/80/g' config.js

EXPOSE 80

CMD cd /usr/local/ghost && npm start