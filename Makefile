dotfiles = $(subst home/, ~/, $(shell git ls-files home))

~: ${dotfiles}

~/.%: home/.%
	@mkdir -p $(dir $@)
	ln -sfn ${PWD}/$< $@
