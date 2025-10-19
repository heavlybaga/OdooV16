#!/bin/bash
set -e

echo "⏳ Waiting for PostgreSQL..."
until pg_isready -h "$PGHOST" -p "$PGPORT" -U "$PGUSER"; do
  sleep 2
done
echo "✅ PostgreSQL ready!"

mkdir -p /tmp/odoo
chown -R odoo:odoo /tmp/odoo

exec odoo -c /etc/odoo/odoo.conf
