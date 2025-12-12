export BILLING_ACCOUNT_ID="014894-4E7D24-63174E"
gcloud billing projects link concise-isotope-481012-t1 --billing-account=014894-4E7D24-63174E

------------------------------------------------------

# Enable all necessary APIs
gcloud services enable \
  aiplatform.googleapis.com \
  storage.googleapis.com \
  cloudresourcemanager.googleapis.com \
  run.googleapis.com \
  cloudbuild.googleapis.com \
  secretmanager.googleapis.com \
  firestore.googleapis.com \
  --project=concise-isotope-481012-t1

echo "✓ APIs enabled successfully"

------------------------------------------------------

# Create service account
gcloud iam service-accounts create dreamboard-sa \
  --display-name="DreamBoard Service Account" \
  --project=concise-isotope-481012-t1

# Grant necessary permissions
gcloud projects add-iam-policy-binding concise-isotope-481012-t1 \
  --member="serviceAccount:dreamboard-sa@concise-isotope-481012-t1.iam.gserviceaccount.com" \
  --role="roles/aiplatform.user"

gcloud projects add-iam-policy-binding concise-isotope-481012-t1 \
  --member="serviceAccount:dreamboard-sa@concise-isotope-481012-t1.iam.gserviceaccount.com" \
  --role="roles/storage.admin"

gcloud projects add-iam-policy-binding concise-isotope-481012-t1 \
  --member="serviceAccount:dreamboard-sa@concise-isotope-481012-t1.iam.gserviceaccount.com" \
  --role="roles/run.invoker"

# Create and download service account key
gcloud iam service-accounts keys create ~/dreamboard-sa-key.json \
  --iam-account=dreamboard-sa@concise-isotope-481012-t1.iam.gserviceaccount.com

echo "✓ Service account created: dreamboard-sa@${concise-isotope-481012-t1}.iam.gserviceaccount.com"
echo "✓ Key saved to: ~/dreamboard-sa-key.json"

------------------------------------------------------

# Create bucket for storing generated assets
export GCS_BUCKET="${concise-isotope-481012-t1}-dreamboard-assets"

gsutil mb -p concise-isotope-481012-t1 -c STANDARD -l us-central1 gs://concise-isotope-481012-t1-dreamboard-assets

echo "✓ Bucket created: gs://${GCS_BUCKET}"

------------------------------------------------------

# Create Firestore database (required by DreamBoard)
gcloud firestore databases create \
  --location=us-central1 \
  --type=firestore-native \
  --project=concise-isotope-481012-t1

echo "✓ Firestore database created"

------------------------------------------------------

# This allows local development to authenticate with GCP
gcloud auth application-default login

echo "✓ Application default credentials configured"

------------------------------------------------------



------------------------------------------------------



------------------------------------------------------