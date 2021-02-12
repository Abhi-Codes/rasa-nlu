FROM rasa/rasa:2.2.5 

WORKDIR /app
COPY . /app
COPY ./data /app/data
USER root
RUN  rasa train

VOLUME /app
VOLUME /app/data
VOLUME /app/models
USER 1001

CMD [ "run","-m","/app/models","--enable-api","--cors","*","--debug" ]