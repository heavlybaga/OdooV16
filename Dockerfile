# ------------------------------------------------------------
# Odoo 16 - Render Free Plan Optimized Dockerfile
# ------------------------------------------------------------

# Use the official Odoo v16 image
FROM odoo:16

# Install tools & dependencies, including gettext-base for envsubst
RUN apt-get update && apt-get install -y \
    git curl nano libpq-dev gettext-base \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Make entrypoint executable
RUN chmod +x /app/entrypoint.sh

# Expose Odoo internal port
EXPOSE 8069

# Run custom entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
