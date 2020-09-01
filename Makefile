install:
	@echo "Installing dependencies..."
	cask install

lint:
	@echo "Linting the package..."
	emacs -Q -batch -l .cask/27.1/elpa/package-lint-20200816.24/package-lint.el \
	-f package-lint-batch-and-exit org-export-confluence.el
