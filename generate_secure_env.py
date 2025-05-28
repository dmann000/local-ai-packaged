#!/usr/bin/env python3
"""
Generate secure credentials for local-ai-packaged
This creates a .env file with strong passwords
"""

import secrets
import string
import os
import shutil
from datetime import datetime

def generate_password(length=32, special_chars=False):
    """Generate a secure password"""
    if special_chars:
        chars = string.ascii_letters + string.digits + "!@#$%^&*()_+-="
    else:
        # Avoid special chars that can cause issues
        chars = string.ascii_letters + string.digits
    return ''.join(secrets.choice(chars) for _ in range(length))

def generate_hex(length=32):
    """Generate a hex string"""
    return secrets.token_hex(length)

print("🔐 Generating secure .env file...")
print("=" * 50)

# Backup existing .env if it exists
if os.path.exists('.env'):
    backup_name = f'.env.backup_{datetime.now().strftime("%Y%m%d_%H%M%S")}'
    shutil.copy('.env', backup_name)
    print(f"✓ Backed up existing .env to {backup_name}")

# Copy .env.example to .env
shutil.copy('.env.example', '.env')
print("✓ Created .env from .env.example")

# Read the file
with open('.env', 'r') as f:
    content = f.read()

# Generate secure values
replacements = {
    'super-secret-key': generate_hex(32),
    'even-more-secret': generate_hex(32),
    'your-super-secret-and-long-postgres-password': generate_password(24),
    'your-super-secret-jwt-token-with-at-least-32-characters-long': generate_hex(32),
    'this_password_is_insecure_and_should_be_updated': generate_password(20),
    'your-tenant-id': str(secrets.randbelow(9000) + 1000),
    'neo4j/password': f'neo4j/{generate_password(20)}',
    'super-secret-key-1': generate_password(24),
    'super-secret-key-2': generate_password(24),
    'super-secret-key-3': generate_hex(32),
    'super-secret-key-4': generate_hex(32),
    'generate-with-openssl': generate_hex(32),
    'your-32-character-encryption-key': generate_hex(16),
    'your-super-secret-and-long-logflare-key': generate_hex(32),
}

# Apply replacements
for old, new in replacements.items():
    content = content.replace(old, new)

# Update domain configuration for production
content = content.replace('# N8N_HOSTNAME=n8n.yourdomain.com', 'N8N_HOSTNAME=dmann.ddns.net')
content = content.replace('# WEBUI_HOSTNAME=openwebui.yourdomain.com', 'WEBUI_HOSTNAME=dmann.ddns.net')
content = content.replace('# LETSENCRYPT_EMAIL=internal', 'LETSENCRYPT_EMAIL=donmann+n8n@gmail.com')

# Write the updated content
with open('.env', 'w') as f:
    f.write(content)

print("\n✅ Secure .env file generated!")
print("\n📋 Important credentials:")
print("=" * 50)

# Extract and display key credentials
lines = content.split('\n')
for line in lines:
    if 'DASHBOARD_USERNAME=' in line:
        print(f"Supabase Dashboard: {line.strip()}")
    elif 'DASHBOARD_PASSWORD=' in line and 'this_password' not in line:
        print(f"Supabase Dashboard: {line.strip()}")
    elif 'POSTGRES_PASSWORD=' in line and 'your-super-secret' not in line:
        print(f"PostgreSQL: {line.strip()}")
    elif 'NEO4J_AUTH=' in line and 'neo4j/password' not in line:
        print(f"Neo4j: {line.strip()}")

print("\n🔒 Security notes:")
print("- All passwords are randomly generated")
print("- .env contains sensitive data - never commit to git!")
print("- Save these credentials in your password manager")
print("\n🚀 Next step: python start_services.py --profile gpu-nvidia")
