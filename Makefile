default:
	@PATH="$(PWD)/bin:${PATH}" ./bin/blarg --verbose ./targets
.PHONY: default

lint:
	@shellcheck **/*.bash **/*.sh config/**/*.sh
	@./bin/custom_lint.sh
.PHONY: lint

update-blarg:
	@curl --proto '=https' --tlsv1.2 \
		--silent \
		--show-error \
		--fail \
		--location "https://github.com/pcrockett/blarg/raw/refs/heads/main/blarg" \
		> bin/blarg.tmp
	@chmod +x bin/blarg.tmp
	@mv bin/blarg.tmp bin/blarg
.PHONY: update-blarg
