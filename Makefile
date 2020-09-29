install:
	@echo "Installing dependencies..."
	cask install

lint:
	@echo "Linting the package..."
	cask emacs -Q -batch -l package-lint.el \
	-f package-lint-batch-and-exit ox-cs.el
	cask emacs -Q --batch -l elisp-lint.el -f \
	elisp-lint-files-batch *.el

clean:
	@echo "Removing the byte compiled file ..."
	rm org-export-confluence-autoloads.el
