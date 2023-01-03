# Dockerfile

# This UNTIL Step "Testing the Dockerized Node Application Image" in document link
# https://semaphoreci.com/community/tutorials/dockerizing-a-node-js-web-application
#FROM node:16.15-alpine3.14
#RUN mkdir -p /opt/app
#WORKDIR /opt/app
#RUN adduser -S app
#COPY addressbook/ .
#RUN npm install
#RUN npm install --save pm2
#RUN chown -R app /opt/app
#USER app
#EXPOSE 3000
#CMD [ "npm", "run", "pm2" ]
FROM registry.semaphoreci.com/node:16
RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN adduser app
COPY addressbook/ .
RUN npm install
RUN npm install --save pm2
RUN chown -R app /opt/app
USER app
EXPOSE 3000
CMD [ "npm", "run", "pm2" ]