from aws_connection import connect_to_aws
from dotenv import load_dotenv
from data.sample_users import all_users

# Load environment variables from .env file
load_dotenv()

def write_message_to_dynamodb(table_name, requests):
    dynamodb = connect_to_aws()
    if dynamodb:
        table = dynamodb.Table(table_name)
        all_responses = []
        for entry in requests:
            response = table.put_item(Item=entry)
            all_responses.append(response)
        return all_responses
    else:
        print("Failed to connect to DynamoDB")
        return None

def read_message_from_dynamodb(table_name, requests, key):
    dynamodb = connect_to_aws()
    if dynamodb:
        table = dynamodb.Table(table_name)
        responses = []
        try:
            for entry in requests:
                response = table.get_item(
                    Key={
                        key: entry
                    }
                )
                if 'Item' in response:
                    responses.append(response['Item'])
                else:
                    print(f"No item found with key: {key}")
                    continue
            return responses
        except Exception as e:
            print(f"Error reading from DynamoDB: {e}")
            return None
    else:
        print("Failed to connect to DynamoDB")
        return None
