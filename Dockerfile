FROM golang AS builder

COPY ./cmd/main.go .

RUN go build -o fc-rocks main.go


FROM scratch

COPY --from=builder /go/fc-rocks .

CMD ["./fc-rocks"]

