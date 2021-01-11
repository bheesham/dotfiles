.PHONY: do up

STOW:=stow --verbose=3
GET:=curl -fsSL

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
	chmod 0755 bin/repoint*
	chmod 0755 bin/implant.sh

ifeq ($(shell uname -s),Linux)
	$(GET) https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 > bin/skaffold && \
		chmod 0755 bin/skaffold

	$(GET) https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 > bin/minikube && \
		chmod 0755 bin/minikube

	$(GET) "https://storage.googleapis.com/kubernetes-release/release/$(shell curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" > bin/kubectl && \
		chmod 0755 bin/kubectl

	$(GET) https://github.com/mozilla/sops/releases/download/v3.6.1/sops-v3.6.1.linux > bin/sops && \
		chmod 0755 bin/sops

	$(GET) -fSsLo terraform.zip https://releases.hashicorp.com/terraform/0.14.4/terraform_0.14.4_linux_amd64.zip && \
		unzip terraform.zip && \
		rm terraform.zip && \
		mv terraform bin/terraform && \
		chmod 0755 bin/terraform
endif

$(HOME)/.asdf:
	mkdir -p $(HOME)/.asdf

$(HOME)/.config:
	mkdir -p $(HOME)/.config

$(HOME)/bin:
	mkdir -p $(HOME)/bin
