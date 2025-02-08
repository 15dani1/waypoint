sample_route1 = {
    'route_id': '1',
    'title': 'NYC stroll',
    'waypoint_list': ['Times Square', 'Empire State Building', 'Chelsea', 'Soho'],
    'duration': '30',
    'mode': 'walk',
    'username': '15dani1',
    'date_added': '02-08-2024',
    'picture': 'test1.jpg',
    'map': 'map1.jpg'
}

sample_route2 = {
    'route_id': '2',
    'title': 'PGH Joyride',
    'waypoint_list': ['CMU', 'Pitt', 'The Point', 'Heinz Field'],
    'duration': '30',
    'mode': 'car',
    'username': 'nikkilovessscats',
    'date_added': '02-08-2024',
    'picture': 'test2.jpg',
    'map': 'map2.jpg'
}

all_routes = [sample_route1, sample_route2]

routes = [route['route_id'] for route in all_routes]