.PHONY: do up

STOW:=stow --verbose=3
GET:=curl -fsS

do: $(HOME)/.config $(HOME)/.asdf $(HOME)/bin up vim config bin general lein
	$(STOW) -S -t $(HOME) vim
	$(STOW) -S -t $(HOME) emacs
	$(STOW) -S -t $(HOME) pyenv
	$(STOW) -S -t $(HOME) config
	$(STOW) -S -t $(HOME) general
	$(STOW) -S -t $(HOME)/bin bin
	$(STOW) -S -t $(HOME)/.asdf asdf
	$(STOW) -S -t $(HOME) lein

up:
	$(GET) https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > vim/.vim/autoload/plug.vim
	$(GET) https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > bin/lein
	$(GET) https://raw.githubusercontent.com/cannam/repoint/master/repoint > bin/repoint
	$(GET) https://raw.githubusercontent.com/cannam/repoint/master/repoint.bat > bin/repoint.bat
	$(GET) https://raw.githubusercontent.com/cannam/repoint/master/repoint.ps1 > bin/repoint.ps1
	$(GET) https://raw.githubusercontent.com/cannam/repoint/master/repoint.sml > bin/repoint.sml
	$(GET) https://raw.githubusercontent.com/cannam/repoint/master/implant.sh > bin/implant.sh
	chmod 0755 bin/lein
	chmod 0755 bin/implant.sh
	chmod 0755 bin/repoint*

$(HOME)/.asdf:
	mkdir -p $(HOME)/.asdf

$(HOME)/.config:
	mkdir -p $(HOME)/.config

$(HOME)/bin:
	mkdir -p $(HOME)/bin
