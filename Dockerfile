FROM odoo:16.0

# copy everything from repo root into /app
COPY . /app
WORKDIR /app

# make entrypoint executable if it exists
RUN if [ -f entrypoint.sh ]; then chmod +x entrypoint.sh; fi

USER odoo
EXPOSE 8069
ENTRYPOINT ["./entrypoint.sh"]
