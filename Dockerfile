FROM mongo:4.4.5-bionic

RUN apt update && apt install -y --no-install-recommends\
	curl\
	python3\
	&& apt-get clean autoclean\
	&& apt-get autoremove --yes\
	&& rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN cd /tmp/ ; curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-336.0.0-linux-x86_64.tar.gz\
	; tar xzf google-cloud-sdk-336.0.0-linux-x86_64.tar.gz\
	; mv google-cloud-sdk /opt

RUN mkdir /opt/ja-mongodump
WORKDIR /opt/ja-mongodump
COPY dump.sh /opt/ja-mongodump
