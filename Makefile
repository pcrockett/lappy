CI_IMAGE ?= lappy-ci

default:
	@PATH="$(PWD)/bin:${PATH}" ./bin/blarg --verbose ./targets
.PHONY: default

pull:
	git -C .blarg/modules/pcrockett/main pull
.PHONY: pull

ci: ci-image
	docker run --rm "$(CI_IMAGE)" make lint
.PHONY: ci

lint:
	@./bin/lint.sh
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

run-target:
	@./bin/blarg --verbose "targets/$(shell cd targets && fzf)"
.PHONY: run-target

ci-image:
	GITHUB_TOKEN="$(GITHUB_TOKEN)" docker build --tag "$(CI_IMAGE)" --secret id=GITHUB_TOKEN .
.PHONY: ci-image
