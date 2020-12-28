RUN_LINTER := docker run -t --rm -v "$(shell pwd):$(shell pwd)" -w "$(shell pwd)"

lint.file:
	${RUN_LINTER} mstruebing/editorconfig-checker:2.2.0 ec -config .ecrc

lint.shell:
	${RUN_LINTER} koalaman/shellcheck-alpine:stable \
		sh -c "find . \
			| grep -E -e '(\.sh\$$)|(\.zshrc)' \
			| grep -v .config/zsh/oh-my-zsh \
			| xargs -I'{}' shellcheck -S warning -e SC1090 -e SC1091 {} ;"

lint.yaml:
	${RUN_LINTER} arhatdev/yamllint:latest yamllint -c .yaml-lint.yml .

lint.all: \
	lint.file \
	lint.shell \
	lint.yaml
