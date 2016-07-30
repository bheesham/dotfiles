.PHONY: help default emacs lein general sm

default: emacs lein general
emacs: $(HOME)/.spacemacs $(HOME)/.emacs.d
lein: $(HOME)/.lein/profiles.clj $(HOME)/bin/lein

GENERAL= bash_profile bashrc gitconfig tmux.conf inputrc
GEN_DEPS= $(foreach G,$(GENERAL), $(HOME)/.$(notdir $(G)))
general: $(GEN_DEPS)
$(HOME)/.%: $(abspath general/%)
	ln -f -s $< $@

$(HOME)/.spacemacs: $(abspath emacs/profile)
	ln -f -s $< $@

$(HOME)/.emacs.d: sm $(abspath emacs/spacemacs)
	ln -f -s $< $@

$(HOME)/.lein/profiles.clj: $(abspath lein/profiles.clj)
	ln -f -s $< $@

$(HOME)/bin/lein: sm $(HOME)/bin $(abspath lein/leiningen/bin/lein)
	ln -f -s $< $@

$(HOME)/bin:
	mkdir -p $(HOME)/bin

sm:
	git submodule update --init
