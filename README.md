# 🦉 Odoo v16 on Render – Free Plan Edition

Deploy Odoo v16 instantly on Render’s free tier.  
This setup is trimmed for lightweight testing / demo use.

## 🚀 One-Click Deploy
[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

## ⚙️ What you get
- Odoo v16 (Slim image)
- Managed PostgreSQL (linked automatically)
- Temporary `/tmp/odoo` filestore
- Auto-generated admin password (`ADMIN_PASSWD` env var)

## 🧠 Notes for Free Plan
- App sleeps after 15 min idle  
- No persistent storage (uploads reset each restart)  
- Free DB expires after 90 days  
- Perfect for UI exploration, module testing, and demos

## 🏁 After deploy
1. Open your Render app URL (`https://odoo-v16.onrender.com`)  
2. Log in using the password in `ADMIN_PASSWD` (env tab)  
3. Create your first database and explore Odoo 🎉
