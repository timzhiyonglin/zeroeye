.PHONY: install-hooks

install-hooks:
	@mkdir -p .git/hooks
	@ln -sf ../../tools/pre-commit .git/hooks/pre-commit
	@chmod +x tools/pre-commit .git/hooks/pre-commit
	@echo "Installed zeroeye diagnostic pre-commit hook."
