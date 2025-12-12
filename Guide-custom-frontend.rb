# 1. Go to your actual project folder (adjusting for your specific path)
cd /Applications/1_rnco/dreamboard

# 2. Check if the frontend folder exists, and go into it
# (Assuming your angular app is in a folder named 'frontend')
cd frontend/src/environments 2>/dev/null || mkdir -p src/environments && cd src/environments

# 3. Create the environment.ts file pointing to port 8000
cat <<EOF > environment.ts
export const environment = {
  production: false,
  apiUrl: 'http://localhost:8000'
};
EOF

# 4. Create the environment.development.ts file pointing to port 8000
cat <<EOF > environment.development.ts
export const environment = {
  production: false,
  apiUrl: 'http://localhost:8000'
};
EOF 

echo "✓ Frontend environment configured for Port 8000"


------------------------------------------------------

cat > .env << EOF
GCS_BUCKET=concise-isotope-481012-t1-dreamboard-assets
PROJECT_ID=concise-isotope-481012-t1
LOCATION=us-central1

ENV=dev

FIRESTORE_DB=dreamboard-db

BACKEND_URL=http://localhost:8000
EOF

echo "✓ NodeJS proxy server configured"

------------------------------------------------------


------------------------------------------------------


------------------------------------------------------
