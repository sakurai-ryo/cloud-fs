FROM golang:1.17.5

ENV ROOT=/go/src/cloud-fs

WORKDIR ${ROOT}
dock
RUN apt-get update && \
    apt-get install -y --no-install-recommends libfuse-dev gcc

COPY . ${ROOT}

RUN CGO_ENABLED=1 GOOS=linux GOARCH=arm64 go build -o ${ROOT}/bin/cloud-fs ./main.go

#CMD ["/go/src/cloud-fs/bin/cloud-fs"]
