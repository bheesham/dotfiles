.PHONY: help default fish emacs clj general sm vim clean noop

GENERAL:= bash_profile bashrc gitconfig tmux.conf inputrc
GEN_DEPS:= $(foreach G,$(GENERAL), $(HOME)/.$(notdir $(G)))
GET:=curl -fsS

default: vim emacs clj general fish
fish: $(HOME)/.config/fish
vim: $(HOME)/.vimrc $(HOME)/.vim $(HOME)/.config/vim $(HOME)/.vim/autoload/pathogen.vim
emacs: $(HOME)/.spacemacs $(HOME)/.emacs.d
clj: $(HOME)/.lein/profiles.clj $(HOME)/bin/lein $(HOME)/bin/boot
general: $(GEN_DEPS) $(HOME)/bin

clean:
	rm -f $(HOME)/.vimrc $(HOME)/.vim $(HOME)/.config/vim
	rm -f $(HOME)/.spacemacs $(HOME)/.emacs.d
	rm -f $(HOME)/bin/lein $(HOME)/bin/boot $(HOME)/.lein/profiles.clj
	rm -f $(GEN_DEPS)

$(HOME)/.%: $(abspath general/%)
	@echo 0 > /dev/null || (test -e $@ && cp $@ $(abspath backup)/$(notdir $<))
	@echo 0 > /dev/null || (test -e $@ && rm $@)
	ln -fs $< $@

# Fish
$(HOME)/.config/fish: $(abspath fish)
	ln -fs $< $@

# Vim
$(HOME)/.vim/autoload/pathogen.vim: noop
	$(GET) https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim > $@

$(HOME)/.vimrc: $(abspath vim/vimrc)
	ln -fs $< $@

$(HOME)/.vim: $(abspath vim/vim)
	ln -Fs $< $@

$(HOME)/.config/vim: $(HOME)/.vim
	ln -Fs $< $@

# Emacs
$(HOME)/.spacemacs: $(abspath emacs/profile)
	ln -fs $< $@

$(HOME)/.emacs.d: $(abspath emacs/spacemacs)
	ln -Fs $< $@

# Lein
$(HOME)/.lein/profiles.clj: $(abspath lein/profiles.clj)
	mkdir -p $(basename $@)
	ln -s $< $@

$(HOME)/bin/lein: $(HOME)/bin noop
	$(GET) https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > $@
	chmod 0755 $@

$(HOME)/bin/boot: $(HOME)/bin noop
	$(GET) https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh > $@
	chmod 0755 $@

# Bin
$(HOME)/bin:
	mkdir -p $(HOME)/bin

sm:
	git submodule update --init
