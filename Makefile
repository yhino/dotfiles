dump-brew:
	brew bundle dump --taps --brews --file Brewfile --force

install-brew:
	brew bundle install --file Brewfile

start-service:
	brew services start sleepwatcher
