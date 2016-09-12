.PHONY: help default emacs lein general sm

default: emacs lein general
emacs: $(HOME)/.spacemacs $(HOME)/.emacs.d
lein: $(HOME)/.lein/profiles.clj $(HOME)/bin/lein

GENERAL= bash_profile bashrc gitconfig tmux.conf inputrc
GEN_DEPS= $(foreach G,$(GENERAL), $(HOME)/.$(notdir $(G)))
general: $(GEN_DEPS)

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
	curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > $@
	chmod 0755 $@

sm:
	git submodule update --init

clean:
	rm -rf $(HOME)/bin/lein $(HOME)/.lein $(HOME)/.emacs.d $(HOME)/.spacemacs \
		$(GEN_DEPS)
