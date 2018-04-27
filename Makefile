.PHONY: do up

STOW:=stow --verbose=3
GET:=curl -fsS

do: $(HOME)/.config $(HOME)/.asdf $(HOME)/bin up vim fish bin general lein
	$(STOW) -S -t $(HOME) vim
	$(STOW) -S -t $(HOME) fish
	$(STOW) -S -t $(HOME) general
	$(STOW) -S -t $(HOME)/bin bin
	$(STOW) -S -t $(HOME)/.asdf asdf
	$(STOW) -S -t $(HOME) lein

up: 
	$(GET) https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > vim/.vim/autoload/plug.vim
	$(GET) https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > bin/lein
	chmod 0755 bin/lein

$(HOME)/.asdf:
	mkdir -p $(HOME)/.asdf

$(HOME)/.config:
	mkdir -p $(HOME)/.config

$(HOME)/bin:
	mkdir -p $(HOME)/bin
