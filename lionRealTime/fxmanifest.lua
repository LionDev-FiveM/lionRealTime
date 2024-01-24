fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Lion Development'
description 'RealTime'
version '1.1'

client_scripts {
	'client.lua',
	'config.lua'
}

server_scripts {
	'server.lua',
	'config.lua'
}

files {
	'version.json'
}

escrow_ignore {
	'client.lua',
	'server.lua',
	'config.lua'
}