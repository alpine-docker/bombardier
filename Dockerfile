FROM golang:alpine as builder

ARG VERSION v1.2.6
ENV UPSTREAM github.com/codesenberg/bombardier

ENV GOPATH /gopath
ENV GOBIN /go/bin

# Install dependencies for building bombardier
# hadolint ignore=DL3017,DL3018
RUN apk --no-cache update && apk --no-cache upgrade && \
 apk --no-cache add ca-certificates git && \
 # Build bombardier client
 echo "Fetching bombardier source" && \
 go install -v -ldflags '-extldflags "-static"' ${UPSTREAM}@v${VERSION}

# start from scratch
FROM scratch
# Copy our static executable
COPY --from=builder /go/bin/bombardier /usr/bin/bombardier
RUN chmod +x /usr/bin/bombardier

ENTRYPOINT ["bombardier"]
CMD ["--help"]
