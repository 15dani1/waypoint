import boto3
from botocore.exceptions import NoCredentialsError, PartialCredentialsError
from dotenv import load_dotenv
import os
from sample_users import sample_user1, sample_user2

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

def write_message_to_dynamodb(table_name):
    dynamodb = connect_to_aws()
    if dynamodb:
        table = dynamodb.Table(table_name)
        response1 = table.put_item(
            Item=sample_user1
        )
        response2 = table.put_item(
            Item=sample_user2
        )
        return response1, response2
    else:
        print("Failed to connect to DynamoDB")
        return None

def read_message_from_dynamodb(table_name, username):
    dynamodb = connect_to_aws()
    if dynamodb:
        table = dynamodb.Table(table_name)
        try:
            response = table.get_item(
                Key={
                    'username': username  # Ensure this matches the primary key attribute name in your DynamoDB table
                }
            )
            if 'Item' in response:
                return response['Item']
            else:
                print(f"No item found with username: {username}")
                return None
        except Exception as e:
            print(f"Error reading from DynamoDB: {e}")
            return None
    else:
        print("Failed to connect to DynamoDB")
        return None

# Example usage
if __name__ == "__main__":
    table_name = 'user'
    
    response1, response2 = write_message_to_dynamodb(table_name)
    if response1 and response2:
        print("Sample users written to DynamoDB:", response1, response2)
    
    print()
    username = '15dani1'
    item = read_message_from_dynamodb(table_name, username)
    if item:
        print("Message read from DynamoDB:", item)
