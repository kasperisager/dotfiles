dotfiles = $(subst home/, ~/, $(shell git ls-files home))

~/.%: home/.%
	@mkdir -p $(dir $@)
	ln -sfn ${PWD}/$< $@

~: ${dotfiles}

