default:
	@BLARG_VERBOSE=1 PATH="$(PWD)/bin:${PATH}" ./bin/blarg ./targets
.PHONY: default
