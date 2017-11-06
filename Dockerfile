# Set the base image to Ubuntu
FROM debian:stable-slim

# File Author / Maintainer
MAINTAINER Andrea Rota <andrearota37354@gmail.com>

# Avoid warnings "Unable to initialize frontend"
ENV DEBIAN_FRONTEND noninteractive

# Copy the application folder inside the container
ADD /app /app

# Install Python, app dependencies and clean pip and apt cache
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils && \
apt-get install -y --no-install-recommends python3-pip python3-setuptools python3-wheel && \
pip3 install -r /app/requirements.txt && \
rm -r /root/.cache && \
apt-get autoremove -y --purge apt-utils && \
apt-get clean

# Expose ports
EXPOSE 5000

# Set the default directory where CMD will execute
WORKDIR /app

# Set the default command to execute
# when creating a new container
# i.e. using CherryPy to serve the application
CMD python3 server.py
