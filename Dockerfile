FROM node:12-alpine
RUN apk add --no-cache bash git openssh  \
			yarn build-base python \
			 python-dev py-pip python2 \
			 zip unzip p7zip
RUN pip install awscli
ADD enablessh.sh /usr/sbin/enablessh
RUN chmod +x /usr/sbin/enablessh 
#RUN chmod 400 ~/ssh_config
