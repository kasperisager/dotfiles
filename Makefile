dotfiles = $(subst home/, ~/, $(shell git ls-files home))

~: /usr/local/bin/brew ${dotfiles}

~/.%: home/.%
	@mkdir -p $(dir $@)
	ln -sfn ${PWD}/$< $@

/usr/local/bin/brew:
	/bin/bash -c "$(curl -fsSL https://git.io/JIY6g)"
