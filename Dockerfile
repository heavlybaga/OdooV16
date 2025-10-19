FROM odoo:16.0

WORKDIR /app
COPY . .

RUN chmod +x /app/entrypoint.sh

USER odoo
EXPOSE 8069
ENTRYPOINT ["/app/entrypoint.sh"]
