FROM nginx:latest

RUN apt-get update && \
    apt-get -y install cron busybox rsync vim && \
    rm /etc/nginx/nginx.conf && \
    mkdir -p /app/log && \
    echo "46 * * * * /bin/bash /app/arch_sync.sh >> /app/log/arch_mirroring.log && /bin/date >> /app/log/arch_mirroring.log" >> /var/spool/cron/crontabs/root 
    
COPY nginx.conf /etc/nginx/nginx.conf
COPY arch_sync.sh /app/arch_sync.sh
COPY start.sh /app/start.sh

RUN chmod -R 755 /app && \
    mkdir -p /app/nginx/archmirror

ENTRYPOINT ["/app/start.sh"]
