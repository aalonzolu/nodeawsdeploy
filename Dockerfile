FROM node:12-alpine
RUN apk add --no-cache bash git openssh  \
			yarn build-base python \
			 python-dev py-pip python2 \
			 zip unzip p7zip
RUN pip install awscli
ADD ./enablessh.sh /usr/local/bin/enablessh
RUN chmod +x /usr/local/bin/enablessh
