import requests
import json
import os
import boto3
from botocore.exceptions import NoCredentialsError
import time


api_address = os.environ.get("API_HOST", "localhost")
api_port = 80

content = {}

def request_authorization(username, password):
    for url in ['v1/sentiment', 'v2/sentiment']:
        r = requests.get(
            url='http://{address}:{port}/{url}'.format(address=api_address, port=api_port, url=url),
            params= {
                'username': username,
                'password': password,
            }
        )
        content[username] = json.loads(r.content)


def upload_to_s3(content):
    s3 = boto3.resource('s3')
    bucket_name = 'pr-microservices-logs-mhmdrza'
    object_key = 'authorization_api_test.log'

    try:
        for username, result in content.items():
            s3.Bucket(bucket_name).put_object(Key=object_key, Body=str(result))
            print(f"Result for username {username} uploaded successfully to {bucket_name}/{object_key}")
    except NoCredentialsError:
        print("Credentials not available")


for username, password in {'signor': 'rayan', 'mohammadreza': 'sarayloo'}.items():
    request_authorization(username, password)

upload_to_s3(content)

retries = 0
# Keep the container alive
while retries < 3:
    time.sleep(60)  # Sleep for 60 seconds
    retries += 1
