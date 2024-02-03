import requests
import os
import boto3
from botocore.exceptions import NoCredentialsError
import time

api_address = os.environ.get("API_HOST", "localhost")
api_port = 80

result_message = []

def request_authentication(username, password):
    r = requests.get(
        url='http://{address}:{port}/permissions'.format(address=api_address, port=api_port),
        params={
            'username': username,
            'password': password,
        }
    )
    output = '''
    ============================
        Authentication test
    ============================

    request done at "/permissions"
    | username={username}
    | password={password}

    expected result = 200
    actual result = {status_code}

    ==>  {test_status}
    '''
    status_code = r.status_code
    if status_code == 200:
        test_status = 'SUCCESS'
    else:
        test_status = 'FAILURE'
    result_message.append(output.format(username=username, password=password, status_code=status_code, test_status=test_status))


def upload_to_s3(result_message):
    s3 = boto3.resource('s3')
    bucket_name = 'pr-microservices-logs-mhmdrza'
    object_key = 'authentication_api_test.log'

    try:
        for result in result_message:
            s3.Bucket(bucket_name).put_object(Key=object_key, Body=result)
            print(f"Result uploaded successfully to {bucket_name}/{object_key}")
    except NoCredentialsError:
        print("Credentials not available")


for username, password in {'pagopa': 'pay', 'signor': 'rayan', 'mohammadreza': 'sarayloo'}.items():
    request_authentication(username, password)


# if os.environ.get('LOG') == '1':
upload_to_s3(result_message)

retries = 0
# Keep the container alive
while retries < 3:
    time.sleep(60)  # Sleep for 60 seconds
    retries += 1