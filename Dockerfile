FROM node:latest

WORKDIR /opt/ipfs

RUN wget https://dist.ipfs.io/go-ipfs/v0.4.11/go-ipfs_v0.4.11_linux-amd64.tar.gz
RUN tar xvfz go-ipfs_v0.4.11_linux-amd64.tar.gz
RUN cp go-ipfs/ipfs /usr/local/bin

WORKDIR /hub
COPY . .

EXPOSE 3000
EXPOSE 4001
EXPOSE 5001
EXPOSE 8080

COPY ./scripts/docker_start.sh docker_start.sh 

RUN ["chmod", "+x", "./docker_start.sh"]

CMD ./docker_start.sh