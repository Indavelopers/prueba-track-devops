import os
from flask import Flask, jsonify
from google.cloud import storage
from google.api_core import exceptions

app = Flask(__name__)

# Get bucket name from an environment variable
BUCKET_NAME = os.environ.get('GCS_BUCKET_NAME')

@app.route('/')
def list_gcs_objects():
    """Lists objects in a GCS bucket."""
    if not BUCKET_NAME:
        return jsonify(error="GCS_BUCKET_NAME environment variable is not set."), 500

    storage_client = storage.Client()

    try:
        blobs = storage_client.list_blobs(BUCKET_NAME)
        object_names = [blob.name for blob in blobs]
        
        response = {
            "bucket": BUCKET_NAME,
            "objects": object_names,
            "app_version": "v1"
        }
        
        print(response)

        return jsonify(response)
    
    except exceptions.NotFound:
        return jsonify(error=f"Bucket '{BUCKET_NAME}' not found."), 404
    except exceptions.Forbidden:
        return jsonify(error=f"Permission denied for bucket '{BUCKET_NAME}'."), 403
    except Exception as e:
        return jsonify(error=f"An unexpected error occurred: {e}"), 500

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))
