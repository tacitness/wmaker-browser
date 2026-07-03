.PHONY: pre-commit pre-push ci-local validate

pre-commit: validate

pre-push: ci-local

ci-local: validate

validate:
	./scripts/validate-docs.sh

