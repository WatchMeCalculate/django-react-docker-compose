FROM python:3.6

ENV PYTHONUNBUFFERED 1

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install build-essential curl
RUN curl -sL https://deb.nodesource.com/setup_10.x|bash -
RUN apt-get install -y nodejs 
RUN nodejs -v && npm -v

# make sure you either copy correct directories individually
# or ensure that node_modules doesn't exist
WORKDIR /django_app
COPY . /django_app

RUN groupadd -r django \
    && useradd -r -d /home/django -g django django 

COPY ./docker_compose/django/production/start.sh /start.sh
COPY ./docker_compose/django/entrypoint.sh /entrypoint.sh

RUN sed -i 's/\r//' /entrypoint.sh \
    && sed -i 's/\r//' /start.sh \
    && chmod +x /entrypoint.sh \
    && chmod +x /start.sh 

RUN pip install -r requirements.txt && npm install && npm run build
RUN chown -R django /django_app

ENTRYPOINT ["/entrypoint.sh"]
