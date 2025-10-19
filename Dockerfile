FROM odoo:16.0

# The base Odoo image already has the required tools preinstalled.
# We skip apt-get to avoid repo errors in Render build environment.

COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER odoo
EXPOSE 8069
ENTRYPOINT ["/entrypoint.sh"]
