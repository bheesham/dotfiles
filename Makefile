.PHONY: help default emacs clj general sm

default: emacs general clj
emacs: $(HOME)/.spacemacs $(HOME)/.emacs.d

GENERAL= bash_profile bashrc gitconfig tmux.conf inputrc
GEN_DEPS= $(foreach G,$(GENERAL), $(HOME)/.$(notdir $(G)))
general: $(GEN_DEPS)

clj: $(HOME)/.lein/profiles.clj $(HOME)/bin/lein $(HOME)/bin/boot

$(HOME)/.%: $(abspath general/%)
	@echo 0 > /dev/null || (test -e $@ && cp $@ $(abspath backup)/$(notdir $<))
	@echo 0 > /dev/null || (test -e $@ && rm $@)
	ln -s $< $@

$(HOME)/.spacemacs: $(abspath emacs/profile)
	ln -s $< $@

$(HOME)/.emacs.d: $(abspath emacs/spacemacs) sm
	ln -s $< $@
	rm -f $(abspath emacs/spacemacs/spacemacs)

$(HOME)/.lein:
	mkdir ~/.lein

$(HOME)/.lein/profiles.clj: $(abspath lein/profiles.clj) $(HOME)/.lein
	ln -s $< $@

$(HOME)/bin:
	mkdir -p $(HOME)/bin

$(HOME)/bin/lein: $(HOME)/bin
	curl -fsSLo $@ https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
	chmod 0755 $@

$(HOME)/bin/boot:
	curl -fsSLo $@ https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh
	chmod 0755 $@

sm:
	git submodule update --init

clean:
	rm -rf $(HOME)/bin/boot $(HOME)/bin/lein $(HOME)/.lein $(HOME)/.emacs.d \
					$(HOME)/.spacemacs $(GEN_DEPS)
