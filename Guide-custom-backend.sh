3. Configure Environment Variables
Create .env file in /backend/app/:

cat > .env << EOF
# GCP Configuration
PROJECT_ID=concise-isotope-481012-t1
LOCATION=us-central1
GCS_BUCKET=concise-isotope-481012-t1-dreamboard-assets

# Environment
ENV=dev

# Firestore
FIRESTORE_DB=dreamboard-db

# Authentication (set to false for local dev)
USE_AUTH_MIDDLEWARE=false

# Optional: Service Account (if not using application default credentials)
# GOOGLE_APPLICATION_CREDENTIALS=${HOME}/dreamboard-sa-key.json
EOF

echo "✓ Backend .env file created at: $(pwd)/.env"


------------------------------------------------------

cd ~/Documents/workspace/dreamboard/frontend/dreamboard


cd ~/Applications/1_rnco/dreamboard/frontend/dreamboard

/Applications/1_rnco/dreamboard/frontend/dreamboard


------------------------------------------------------
