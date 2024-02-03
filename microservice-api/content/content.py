import requests
import json
import os
import boto3
from botocore.exceptions import NoCredentialsError
import time

api_address = os.environ.get("API_HOST", "localhost")
api_port = 80
content = {}

def request_sentence(sentence):
    r = requests.get(
        url='http://{address}:{port}/v2/sentiment'.format(address=api_address, port=api_port),
        params= {
            'username': 'mohammadreza',
            'password': 'sarayloo',
            'sentence': sentence
        }
    )
    score = json.loads(r.content)['score']
    content[sentence] = score


def upload_to_s3(content):
    s3 = boto3.resource('s3')
    bucket_name = 'pr-microservices-logs-mhmdrza'
    object_key = 'content_api_test.log'

    try:
        for x in content.items():
            s3.Bucket(bucket_name).put_object(Key=object_key, Body=str(x))
            print(f"Result for sentence {x[0]} uploaded successfully to {bucket_name}/{object_key}")
    except NoCredentialsError:
        print("Credentials not available")

for sentence in ['Python is beautiful', 'Error sucks']:
    request_sentence(sentence)

upload_to_s3(content)


retries = 0
# Keep the container alive
while retries < 2:
    time.sleep(60)  # Sleep for 60 seconds
    retries += 1