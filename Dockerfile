FROM ubuntu:14.04

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install wget git pwgen automake libdb++-dev build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev libevent-dev libminiupnpc-dev software-properties-common python-software-properties g++ bsdmainutils && \
	add-apt-repository ppa:bitcoin/bitcoin && \
	apt-get update && \
	apt-get -y install libdb4.8-dev libdb4.8++-dev

WORKDIR /root
RUN git clone https://github.com/chaincoin-legacy/chaincoin && \
	cd /root/chaincoin/ && \
	./autogen.sh && ./configure --without-gui && \
	make && make install && \
	cd ~ && rm -rf /root/chaincoin/

COPY *.sh ./

CMD [ "./start.sh" ]