FROM odoo:16.0

# Copy all project files into the image
COPY . /app
WORKDIR /app

USER odoo
EXPOSE 8069
ENTRYPOINT ["bash", "entrypoint.sh"]
