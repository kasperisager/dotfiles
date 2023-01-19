dotfiles = $(subst home/, ~/, $(shell git ls-files home))

~: /usr/local/bin/brew ${dotfiles}

~/.%: home/.%
	@mkdir -p $(dir $@)
	ln -sfn ${PWD}/$< $@

/opt/homebrew/bin/brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
