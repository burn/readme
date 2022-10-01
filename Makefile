MAKEFLAGS += --silent
SHELL=/bin/bash
R=$(shell git rev-parse --show-toplevel)

help: ## print help
	echo ""; echo "make [OPTIONS]"; echo ""; echo "OPTIONS:"
	grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}\
	               {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

README.md: readme.lua ## update README.md, publish
	lua $< $< > $@
	
y?=saving
itso: README.md  ## commit to Git. To add a message, set `y=message`.
	git commit -am "$y"; git push; git status
