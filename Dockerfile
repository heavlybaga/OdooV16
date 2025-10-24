# ------------------------------------------------------------
# Odoo 16 - Render Free Plan Optimized Dockerfile (Fixed Permissions)
# ------------------------------------------------------------

FROM odoo:16

# Switch to root for package installation
USER root

# Install minimal dependencies (no libpq-dev to avoid conflicts)
RUN apt-get update && apt-get install -y \
    git curl nano gettext-base \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Fix permissions so odoo user can write to /app
RUN chmod +x /app/entrypoint.sh && chown -R odoo:odoo /app

# Switch back to the Odoo runtime user
USER odoo

# Expose Odoo internal port
EXPOSE 8069

# Run entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
