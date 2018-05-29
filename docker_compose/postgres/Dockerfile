FROM postgres:latest

COPY backup.sh /usr/local/bin/backup
RUN chmod +x /usr/local/bin/backup

COPY backup_clean.sh /usr/local/bin/backup_clean
RUN chmod +x /usr/local/bin/backup_clean

COPY postgres_cron /postgres_cron
RUN crontab /postgres_cron
