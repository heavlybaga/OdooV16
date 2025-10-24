# ------------------------------------------------------------
# Odoo 16 - Render Free Plan Optimized Dockerfile (Option 2)
# Lightweight, conflict-free build
# ------------------------------------------------------------

# Use the official Odoo 16 image as base
FROM odoo:16

# Switch to root for package installation
USER root

# Install minimal dependencies (no libpq-dev to avoid conflicts)
# gettext-base provides 'envsubst' used in entrypoint.sh
RUN apt-get update && apt-get install -y \
    git curl nano gettext-base \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files into the container
COPY . /app

# Make sure the entrypoint script is executable
RUN chmod +x /app/entrypoint.sh

# Switch back to the Odoo runtime user for safety
USER odoo

# Expose Odoo's default internal port
EXPOSE 8069

# Launch the custom entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]
