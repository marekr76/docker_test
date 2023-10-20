# syntax=docker/dockerfile:1

FROM busybox:latest

RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

# put script code directly to the file
COPY --chmod=755 <<EOF /app/run.sh
#!/bin/sh
while true; do
  echo -ne "The time is now $(date +%T)\\r"
  sleep 1
done
EOF

ENTRYPOINT /app/run.sh
