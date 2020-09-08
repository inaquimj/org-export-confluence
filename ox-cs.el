;;; ox-cs.el --- Export org-mode files to confluence storage
     
;; Copyright (C) 2020 

;; Author: Andre Toledo <aandreetoledo@gmail.com>
;; Maintainer: Inaqui Medina <inaqui.medina@gmail.com>
;; Created: 14 Jul 2010
;; Keywords: languages
;; Version: 0.1
;; URL: https://github.com/inaquimj/org-export-confluencev
;; Package-Requires: ((emacs "24.4"))

;;; Commentary:

;; This package tailors org-mode export to html to match the syntax of
;; confluence storage.

(require 'org)
(provide 'ox-cs)

(setq org-html-head-include-default-style nil)
(setq org-html-table-default-attributes nil)

(org-export-define-derived-backend 'confluence-storage 'html
				   :menu-entry '(?C "Confluence Storage" ox-cs)
				   :translate-alist '((template . ox-cs-template)
						      (inner-template . ox-cs-inner-template)))


;;;###autoload
(defun ox-cs
(&optional async subtreep visible-only body-only ext-plist)
  (interactive)
  (org-export-to-buffer 'confluence-storage "*Org Confluence Storage Export*"
    async subtreep visible-only body-only ext-plist (lambda () (html-mode))))   

(defun ox-cs-template (contents info) contents)
(defun ox-cs-inner-template (contents info) (concat "<ac:structured-macro ac:macro-id=\"954618d1-3832-4140-a7c1-e0120ef6d3dc\" ac:name=\"toc\" ac:schema-version=\"1\"/>\n\n" contents))

;;; ox-cs.el ends here
