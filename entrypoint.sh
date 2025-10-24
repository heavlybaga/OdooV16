#!/bin/bash
set -e

echo "DEBUG: ADMIN_PASSWD=$ADMIN_PASSWD"
echo "⏳ Waiting for PostgreSQL..."
until pg_isready -h "$PGHOST" -p "$PGPORT" -U "$PGUSER"; do
  sleep 2
done
echo "✅ PostgreSQL ready!"

mkdir -p /tmp/odoo
exec odoo -c /app/odoo.conf
echo "DEBUG: Pinging database host..."
ping -c 3 "$PGHOST" || echo "❌ Ping failed"
echo "DEBUG: Running pg_isready check..."
pg_isready -h "$PGHOST" -p "$PGPORT" -U "$PGUSER"
