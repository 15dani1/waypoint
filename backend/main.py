# Example usage
import constants
from data.sample_users import all_users, usernames
from data.sample_routes import all_routes, routes
from data.sample_waypoints import all_waypoints, waypoints
from dynamodb_operations import read_message_from_dynamodb, write_message_to_dynamodb

if __name__ == "__main__":

    print('Menu:')
    print('1. Write to DynamoDB')
    print('2. Read from DynamoDB')
    print('3. Exit')
    print('------------------')
    choice = input('Enter your choice: ')

    if choice == '1':
        choice_type = input('Enter 1 to create users, Enter 2 to create routes, Enter 3 to create waypoints: ')
        table_name = ''
        requests = []
        if choice_type == '1':
            table_name = constants.USER_TABLE_NAME
            requests = all_users
        elif choice_type == '2':
            table_name = constants.ROUTE_TABLE_NAME
            requests = all_routes
        elif choice_type == '3':
            table_name = constants.WAYPOINT_TABLE_NAME
            requests = all_waypoints
        
        write_responses = write_message_to_dynamodb(table_name, requests)
        for response in write_responses:
            print("Message written to DynamoDB:", response)
            print()

    elif choice == '2':
        choice_type = input('Enter 1 to read users, Enter 2 to read routes, Enter 3 to read waypoints: ')
        table_name = ''
        requests = []
        key = ''
        if choice_type == '1':
            table_name = constants.USER_TABLE_NAME
            requests = usernames
            key = constants.USER_TABLE_NAME_PARTITION_KEY
        elif choice_type == '2':
            table_name = constants.ROUTE_TABLE_NAME
            requests = routes
            key = constants.ROUTE_TABLE_NAME_PARTITION_KEY
        elif choice_type == '3':
            table_name = constants.WAYPOINT_TABLE_NAME
            requests = waypoints
            key = constants.WAYPOINT_TABLE_NAME_PARTITION_KEY

        read_responses = read_message_from_dynamodb(table_name, requests, key)
        for response in read_responses:
            print("Message read from DynamoDB:", response)
            print()

    elif choice == '3':
        print('Exiting...')
        exit

    else:
        print('Invalid choice. Please try again.')  