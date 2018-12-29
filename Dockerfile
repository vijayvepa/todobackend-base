FROM ubuntu:trusty
MAINTAINER Justin Menga <justin.menga@gmail.com>

# Prevent dpkg errors
ENV TERM=xterm-256color

# Set mirrors to NZ
# RUN sed -i "s/http:\/\/archive./http:\/\/nz.archive./g" /etc/apt/sources.list

# Install Python runtime
RUN apt-get update && \
	apt-get install -y \
	-o APT::Install-Recommend=false -o APT::Install-Suggests=false \
	python python-virtualenv libpython2.7 python-mysqldb

# Create virtual environment
# Upgrade PIP in virtual environment to latest version
# See https://hynek.me/articles/virtualenv-lives

RUN virtualenv /appenv && \
## same as source /appenv/bin/activate 
	. /appenv/bin/activate && \ 
	pip install pip --upgrade 

# Add entrypoint script 
## copy from local scripts folder
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x  /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]