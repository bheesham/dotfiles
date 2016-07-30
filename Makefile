.PHONY: help default emacs lein general sm

default: emacs lein general
emacs: $(HOME)/.spacemacs $(HOME)/.emacs.d
lein: $(HOME)/.lein/profiles.clj $(HOME)/bin/lein

GENERAL= bash_profile bashrc gitconfig tmux.conf inputrc
GEN_DEPS= $(foreach G,$(GENERAL), $(HOME)/.$(notdir $(G)))
general: $(GEN_DEPS)
$(HOME)/.%: $(abspath general/%)
	ln -s $< $@

$(HOME)/.spacemacs: $(abspath emacs/profile)
	ln -s $< $@

$(HOME)/.emacs.d: $(abspath emacs/spacemacs) sm 
	ln -s $< $@
	rm -f $(abspath emacs/spacemacs/spacemacs)

$(HOME)/.lein/profiles.clj: $(abspath lein/profiles.clj)
	ln -s $< $@

$(HOME)/bin/lein:
	curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > $@
	chmod 0755 $@

$(HOME)/bin:
	mkdir -p $(HOME)/bin

sm:
	git submodule update --init
