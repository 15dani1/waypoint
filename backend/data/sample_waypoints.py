from decimal import Decimal

sample_waypoint1 = {
    'id': '1',
    'name': 'CMU',
    'coordinates': [Decimal('40.4433'), Decimal('-79.9434')],
    'description': 'Carnegie Mellon University',
    'link': 'maps.google.com',
}

sample_waypoint2 = {
    'id': '2',
    'name': 'Pitt',
    'coordinates': [Decimal('40.4443'), Decimal('-79.9534')],
    'description': 'University of Pittsburgh',
    'link': 'maps.google.com',
}

all_waypoints = [sample_waypoint1, sample_waypoint2]

waypoints = [waypoint['id'] for waypoint in all_waypoints]