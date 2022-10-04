#                            __                          
#                           /\ \                         
#  _ __     __      __      \_\ \     ___ ___       __   
# /\`'__\ /'__`\  /'__`\    /'_` \  /' __` __`\   /'__`\ 
# \ \ \/ /\  __/ /\ \L\.\_ /\ \L\ \ /\ \/\ \/\ \ /\  __/ 
#  \ \_\ \ \____\\ \__/.\_\\ \___,_\\ \_\ \_\ \_\\ \____\
#   \/_/  \/____/ \/__/\/_/ \/__,_ / \/_/\/_/\/_/ \/____/

MAKEFLAGS += --silent
SHELL=/bin/bash
R=$(shell dirname $(shell git rev-parse --show-toplevel))

help: ## print help
	printf "\n#readme\nmake [OPTIONS]\n\nOPTIONS:\n"
	grep -E '^[a-zA-Z_\.-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}\
	               {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

README.md: readme.lua ## update README.md, publish
	lua $< $< > $@
	
y?=saving
itso: README.md  ## commit to Git. To add a message, set `y=message`.
	git commit -am "$y"; git push; git status
