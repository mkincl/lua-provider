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

# Actual targets
LUA_FILES = $(shell find -name '*.lua')

.PHONY: lint-$(NAME)-stylua
lint-$(NAME): lint-$(NAME)-stylua

lint-$(NAME)-stylua:
	stylua --check $(LUA_FILES)

.PHONY: fix-$(NAME)-stylua
fix-$(NAME): fix-$(NAME)-stylua

fix-$(NAME)-stylua:
	stylua $(LUA_FILES)
