FROM alpine:latest
RUN apk --update add bash vim make nasm
RUN echo "PS1='\\w\\$ '" >> /root/.bashrc
COPY vimrc /root/.vimrc

RUN mkdir /root/srcs
WORKDIR /root/srcs
CMD [ "/bin/bash" ]
