RUN_LINTER := docker run -t --rm -v "$(shell pwd):$(shell pwd)" -w "$(shell pwd)"

lint.file:
	${RUN_LINTER} mstruebing/editorconfig-checker:2.2.0 ec -config .ecrc

lint.shell:
	${RUN_LINTER} koalaman/shellcheck-alpine:stable \
		sh -c "find . \
			| grep -E -e '.sh\$$' \
			| grep -v vendor \
			| grep -v pkg/mesh \
			| xargs -I'{}' shellcheck -S warning -e SC1090 -e SC1091 {} ;"

lint.go:
	${RUN_LINTER} golangci/golangci-lint:v1.33.0 golangci-lint run --fix

lint.yaml:
	${RUN_LINTER} arhatdev/yamllint:latest yamllint -c .yaml-lint.yml .

lint.all: \
	lint.file \
	lint.shell \
	lint.go \
	lint.yaml
