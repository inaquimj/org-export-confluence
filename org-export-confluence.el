(defun org-export-confluence
(&optional async subtreep visible-only body-only ext-plist)
  (interactive)
  (org-export-to-buffer 'latex "*Org LATEX Export*"
    async subtreep visible-only body-only ext-plist (lambda () (LaTeX-mode))))
