dump-brew:
	brew bundle dump --taps --brews --casks --file Brewfile --force

install-brew:
	brew bundle install --file Brewfile
