FROM node:20-alpine
ARG FIREBASE_VERSION=13.15.2
RUN apk --no-cache add openjdk11-jre bash curl openssl gettext nano nginx sudo && \
    npm cache clean --force && \
    npm i -g firebase-tools@$FIREBASE_VERSION
RUN mkdir /config
VOLUME /config
COPY ./.firebaserc /config
COPY ./firebase.json /config
WORKDIR /config
ENTRYPOINT [ "firebase" ]
CMD ["serve"]