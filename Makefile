-include ../etc/Makefile

README.md: readme.lua ## update readme
	(echo "\`\`\`css"; lua readme.lua -h; echo "\`\`\`") > $@
	lua readme.lua $^ >> $@
