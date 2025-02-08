import boto3
from botocore.exceptions import NoCredentialsError, PartialCredentialsError
import os

def connect_to_aws():
    try:
        # Initialize a session using Amazon DynamoDB
        session = boto3.Session(
            aws_access_key_id=os.getenv('AWS_ACCESS_KEY'),
            aws_secret_access_key=os.getenv('AWS_SECRET_KEY'),
            region_name=os.getenv('AWS_REGION')
        )
        dynamodb = session.resource('dynamodb')
        return dynamodb
    except (NoCredentialsError, PartialCredentialsError) as e:
        print(f"Credentials error: {e}")
        return None
