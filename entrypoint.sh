#!/bin/bash
set -e

echo "⏳ Waiting for PostgreSQL..."
until pg_isready -h "$PGHOST" -p "$PGPORT" -U "$PGUSER"; do
  sleep 2
done
echo "✅ PostgreSQL ready!"

# Expand environment variables in odoo.conf (e.g. ${PGHOST}, ${PGUSER}, etc.)
echo "Expanding environment variables in odoo.conf..."
envsubst < /app/odoo.conf > /tmp/odoo.conf
mv /tmp/odoo.conf /app/odoo.conf

# Ensure data directory exists
mkdir -p /tmp/odoo

# Initialize the database if empty
echo "Checking if database '$PGDATABASE' is initialized..."
TABLE_COUNT=$(psql -h "$PGHOST" -U "$PGUSER" -d "$PGDATABASE" -Atc \
"SELECT count(*) FROM pg_tables WHERE schemaname='public';" || echo 0)

if [ "$TABLE_COUNT" -eq 0 ]; then
  echo "⚙️ Database '$PGDATABASE' is empty — initializing base Odoo schema..."
  odoo -d "$PGDATABASE" -i base --without-demo=all --stop-after-init
  echo "✅ Initialization complete."
else
  echo "✅ Database '$PGDATABASE' already initialized ($TABLE_COUNT tables found)."
fi

# Start Odoo
echo "🚀 Starting Odoo..."
exec odoo -c /app/odoo.conf
