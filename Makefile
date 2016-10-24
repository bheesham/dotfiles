.PHONY: help default emacs lein general sm vim clean noop

default: vim emacs lein general
vim: $(HOME)/.vimrc $(HOME)/.vim $(HOME)/.config/vim $(HOME)/.vim/autoload/pathogen.vim
emacs: $(HOME)/.spacemacs $(HOME)/.emacs.d
lein: $(HOME)/.lein/profiles.clj $(HOME)/bin/lein

clean:
	rm -f $(HOME)/.vimrc $(HOME)/.vim $(HOME)/.config/vim
	rm -f $(HOME)/.spacemacs $(HOME)/.emacs.d
	rm -f $(HOME)/bin/lein $(HOME)/.lein/profiles.clj

GENERAL= bash_profile bashrc gitconfig tmux.conf inputrc
GEN_DEPS= $(foreach G,$(GENERAL), $(HOME)/.$(notdir $(G)))

general: $(GEN_DEPS)
$(HOME)/.%: $(abspath general/%)
	ln -s $< $@

# Vim
$(HOME)/.vimrc: $(abspath vim/vimrc)
	ln -fs $< $@

$(HOME)/.vim/autoload/pathogen.vim: vim/vim/autoload/pathogen.vim

vim/vim/autoload/pathogen.vim: noop
	curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim > $@

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
	ln -s $< $@

$(HOME)/bin/lein: noop
	curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > $@
	chmod 0755 $@

# Bin
$(HOME)/bin:
	mkdir -p $(HOME)/bin

sm:
	git submodule update --init
