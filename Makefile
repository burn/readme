-include ../etc/Makefile

README.md: readme.lua ## update readme
	(echo "\`\`\`svg"; lua readme.lua -h; echo "\`\`\`") > $@
	lua readme.lua $^ > $@
