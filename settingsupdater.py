import configparser
import os

config = configparser.ConfigParser()

config['PLEX'] = {
	'anime_section': os.environ.get('PLEX_SECTION'),
	'authentication_method': 'direct',
	'base_url': os.environ.get('PLEX_URL'),
	'token': os.environ.get('PLEX_TOKEN'),
	'home_user_sync': os.environ.get('PLEX_SYNC'),
	'home_username': os.environ.get('PLEX_SYNC_USERNAME'),
	'home_server_base_url': os.environ.get('PLEX_SYNC_URL'),
}

config['ANILIST'] = {
	'username': os.environ.get('ANI_USERNAME'),
	'access_token': os.environ.get('ANI_TOKEN'),
	'plex_episode_count_priority': os.environ.get('ANI_PLEXCOUNT_PRIORITY'),
	'skip_list_update': os.environ.get('ANI_SKIP_LISTUPDATE')
}

with open('/plexanisync/settings.ini', 'w') as configfile:
	config.write(configfile)
