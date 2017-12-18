# golang image where workspace (GOPATH) configured at /go.
FROM golang

# Copy the local package files to the container’s workspace.
ADD . /go/src/github.com/samiaoussena/CI_OddJobs

# Setting up working directory
WORKDIR /go/src/github.com/samiaoussena/CI_OddJobs

# Get godeps for managing and restoring dependencies
RUN go get github.com/tools/godep

# Restore godep dependencies
RUN godep restore 

# Build 
RUN go install github.com/samiaoussena/CI_OddJobs 

# Run the taskmanager command when the container starts.
ENTRYPOINT /go/bin/CI_OddJobs

# Service listens on port 3001.
EXPOSE 3001