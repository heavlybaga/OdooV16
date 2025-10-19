FROM odoo:16.0-slim

USER root
RUN apt-get update && apt-get install -y     git curl nano libpq-dev  && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER odoo
EXPOSE 8069
ENTRYPOINT ["/entrypoint.sh"]
