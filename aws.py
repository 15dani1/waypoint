import boto3
from botocore.exceptions import NoCredentialsError, PartialCredentialsError
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

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

def write_message_to_dynamodb(table_name, message):
    dynamodb = connect_to_aws()
    if dynamodb:
        table = dynamodb.Table(table_name)
        response = table.put_item(
            Item={
                'id': '1',  # Ensure this matches the primary key attribute name in your DynamoDB table
                'Message': message
            }
        )
        return response
    else:
        print("Failed to connect to DynamoDB")
        return None

# Example usage
if __name__ == "__main__":
    table_name = 'user'
    message = 'Hello, DynamoDB!'
    response = write_message_to_dynamodb(table_name, message)
    if response:
        print("Message written to DynamoDB:", response)
