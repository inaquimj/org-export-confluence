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

;;; Code:

(require 'ox)
(require 'org)
(provide 'ox-cs)

(setq org-html-head-include-default-style nil)
(setq org-html-table-default-attributes nil)


(org-export-define-derived-backend 'confluence-storage 'html
  :menu-entry '(?C "Confluence Storage" ox-cs)
  :translate-alist '((template . ex-cs-template)
		     (innter-template . ox-cs-inner-template)))

;;;###autoload
(defun ox-cs
    (&optional async subtreep visible-only body-only ext-plist)
  "This is te entry point to the program.
ASYNC
SUBTREEP
VISIBLE-ONLY
BODY-ONLY
EXT-PLIST"
  (interactive)
  (org-export-to-buffer
      'confluence-storage
      "*Org Confluence Storage Export*"
    async
    subtreep
    visible-only
    body-only
    ext-plist (lambda () (html-mode))))

(defun ox-cs-template (contents info)
  "Simplify template eliminating unecessary elements.
Arguments:
CONTENTS
INFO"
  contents)

(defun ox-cs-inner-template (contents info)
  "Implement Confluence Table of Contents.
Arguments:
CONTENTS
INFO"
  (concat "<ac:structured-macro ac:name=\"toc\" \
 ac:schema-version=\"1\"/>\n\n" contents))

;;; ox-cs.el ends here
