# Careful about copy/pasting, Makefiles want tabs!
.PHONY: update
update:
	home-manager switch --flake .#sirwayne

.PHONY: clean
clean:
	nix-collect-garbage -d

.PHONY: flake-update
flake-update:
	nix flake update