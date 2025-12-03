# syntax=docker/dockerfile:1

FROM busybox:stable

RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

# put script code directly to the file
COPY --chmod=750 <<EOF /app/run.sh
#!/bin/sh
while true; do
  echo -ne "The time is now $(date +%T)\\r"
  sleep 1
done
EOF

ENTRYPOINT /app/run.sh
