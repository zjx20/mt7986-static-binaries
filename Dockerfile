FROM alpine:latest
COPY /bin/* /bin
ENTRYPOINT ["/bin/sh"]