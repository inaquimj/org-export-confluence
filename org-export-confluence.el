(org-export-define-derived-backend 'confluence-storage 'html
				   :menu-entry '(?C "Confluence Storage" org-confluence-storage-export-as-confluence-storage))

 ;;;###autoload
(defun org-confluence-storage-export-as-confluence-storage
(&optional async subtreep visible-only body-only ext-plist)
  (interactive)
  (org-export-to-buffer 'confluence-storage "*Org Confluence Storage Export*"
    async subtreep visible-only body-only ext-plist (lambda () (html-mode))))   
