sample_playlist1 = {
    'name': 'NYC',
    'routes': ['NYC stroll', 'NYC sightseeing'],
    'highlights': ['Times Square', 'Empire State Building'],
    'description': 'Best of NYC',
    'picture': 'image1.jpg',
}

sample_playlist2 = {
    'name': 'Pittsburgh',
    'routes': ['Sheetz Run', 'Pittsburgh Joyride'],
    'highlights': ['CMU', 'Pitt'],
    'description': 'Best of Pittsburgh',
    'picture': 'image2.jpg',
}

all_playlists = [sample_playlist1, sample_playlist2]

playlists = [playlist['name'] for playlist in all_playlists]