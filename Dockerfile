# Start from the official Go image
FROM golang:1.22-alpine AS builder

# Set working directory
WORKDIR /app

# Copy go.mod and go.sum, then download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code
COPY . .

# Build the Go binary
RUN go build -o url-shortener main.go

# ----------------------------
# Final lightweight image
FROM alpine:latest

# Set working directory
WORKDIR /root/

# Copy the built binary from builder
COPY --from=builder /app/url-shortener .

# Expose port 8080
EXPOSE 8080

# Run the binary
CMD ["./url-shortener"]
