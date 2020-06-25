FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install bash curl git openssh-client  \
			yarn build-essential python \
			 python-dev python-pip \
			 zip unzip p7zip -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn -y
RUN pip install awscli
ADD enablessh.sh /usr/sbin/enablessh
RUN chmod +x /usr/sbin/enablessh 
#RUN chmod 400 ~/ssh_config
