sample_user1 = {
    'username': '15dani1',
    'name': 'Rahul Dani',
    'password': 'test$123',
    'email': 'rdani@andrew.cmu.edu',
    'routes': ['Pittsburgh', 'NYC'],
    'history': ['Los Angeles', 'San Francisco'],
    'saves': ['Chicago', 'Seattle'],
    'favorites': ['Miami', 'Boston']
}

sample_user2 = {
    'username': 'nikkilovessscats',
    'name': 'Nikki Chizmar',
    'password': 'simba$123',
    'email': 'nchizmar@andrew.cmu.edu',
    'routes': ['Los Angeles', 'San Francisco'],
    'history': ['Pittsburgh', 'NYC'],
    'saves': ['Chicago', 'Seattle'],
    'favorites': ['Miami', 'Boston']
}

all_users = [sample_user1, sample_user2]

usernames = [user['username'] for user in all_users]

