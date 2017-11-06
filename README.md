# Flask-serve-ML

This repository contains a simple implementation of a Flask app serving a machine learning model as JSON REST API.

The deployment uses [CherryPy](http://cherrypy.org/]) as WSGI server implementation. The project contains also a Dockerfile to create a containerized version of the application. The image is based on a Debian:latest-slim base image and once built, is around 120 MB (thanks to [Michele Bologna](https://github.com/mbologna) for the suggestions).

## Running

### Start as Python Process

Just type ```./start-server.sh```.

### Start as Docker Container

First build the Docker image and then run it.

```
docker build -t pyml_img .
docker run --name pyml_instance -p 5000:5000 -i -t pyml_img
```

## References

* DigitalOcean guide on [how to containerize Python web applications](https://www.digitalocean.com/community/tutorials/docker-explained-how-to-containerize-python-web-applications).
