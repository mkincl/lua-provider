NAME := lua
VERSION := v1

# Container target
IMAGE_LUA := ghcr.io/mkincl/$(NAME)-provider:$(VERSION)

.PHONY: enter-container-$(NAME)
enter-container-$(NAME):
	docker run --rm --interactive --tty --pull always --volume "$$(pwd)":/pwd --workdir /pwd $(IMAGE_LUA)

# Generic targets
.PHONY: lint lint-$(NAME)
lint: lint-$(NAME)

.PHONY: fix fix-$(NAME)
fix: fix-$(NAME)

# Which files to act on. This is overrideable.
FILES_LUA = $(shell find -name '*.lua')

.PHONY: has-files-lua
has-files-lua:
	@for file in $(FILES_LUA); do exit 0; done; echo "FILES_LUA is empty"; exit 1

# Specific targets
.PHONY: lint-$(NAME)-stylua
lint-$(NAME): lint-$(NAME)-stylua

lint-$(NAME)-stylua: has-files-lua
	stylua --check $(FILES_LUA)

.PHONY: fix-$(NAME)-stylua
fix-$(NAME): fix-$(NAME)-stylua

fix-$(NAME)-stylua: has-files-lua
	stylua $(FILES_LUA)
