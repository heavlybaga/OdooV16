# ------------------------------------------------------------
# Odoo 16 - Render Free Plan Optimized Dockerfile (Fixed permissions)
# ------------------------------------------------------------

FROM odoo:16

# Switch to root to install packages
USER root

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

# Switch back to odoo user for runtime
USER odoo

# Expose Odoo internal port
EXPOSE 8069

# Start Odoo
ENTRYPOINT ["/app/entrypoint.sh"]
