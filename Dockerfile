FROM --platform=$TARGETPLATFORM zjx20/upx:latest AS upx
FROM --platform=$TARGETPLATFORM alpine:latest AS compress
COPY --from=upx /bin/upx /bin/upx
RUN  mkdir -p /mt7986-bin
COPY bin/* /mt7986-bin
RUN  /bin/upx --best --lzma /mt7986-bin/*

FROM alpine:latest
COPY --from=compress /mt7986-bin/* /bin
ENTRYPOINT ["/bin/sh"]