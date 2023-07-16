# syntax=docker/dockerfile:1

FROM busybox:latest

# put script code directly to the file
COPY --chmod=750 <<EOF /app/run.sh
#!/bin/sh
while true; do
  echo -ne "The time is now $(date +%T)\\r"
  sleep 1
done
EOF

ENTRYPOINT /app/run.sh
