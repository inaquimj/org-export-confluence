install:
	@echo "Installing dependencies..."
	cask install

lint:
	@echo "Linting the package..."
	cask emacs -Q -batch -l package-lint.el \
	-f package-lint-batch-and-exit ox-cs
