.PHONY: do up

STOW:=stow --verbose=3
GET:=curl -fsS

do: $(HOME)/.config $(HOME)/bin up vim fish bin general
	$(STOW) -S -t $(HOME) vim
	$(STOW) -S -t $(HOME) fish
	$(STOW) -S -t $(HOME) general
	$(STOW) -S -t $(HOME)/bin bin

up: 
	$(GET) https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > vim/.vim/autoload/plug.vim
	$(GET) https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > bin/lein
	$(GET) https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh > bin/boot
	chmod 0755 bin/lein bin/boot

$(HOME)/.config:
	mkdir -p $(HOME)/.config

$(HOME)/bin:
	mkdir -p $(HOME)/bin

