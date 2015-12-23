;;; package --- My org-mode config

;;; Commentary:

;;; Code:

(require 'use-package)
(use-package quelpa-use-package)
(use-package org
  :quelpa (org-plus-contrib :url "git://orgmode.org/org-mode.git" :fetcher git :files ("lisp/*.el" "contrib/lisp/*.el" "doc/dir" "doc/*.texi"))
  :mode ("\\.org\\'" . org-mode)
  :bind (("C-c l" . org-store-link)
         ("C-c c" . org-capture)
         ("C-c a" . org-agenda)
         ("C-c b" . org-iswitchb)
         ("C-c F" . oog))
  :init
  :config
  (load "~/.emacs.d/prelude/personal/rfnash/rfnash-org-mode.el")
  (defun prelude-org-mode-hook ()
    (let ((oldmap (cdr (assoc 'prelude-mode minor-mode-map-alist)))
          (newmap (make-sparse-keymap)))
      (set-keymap-parent newmap oldmap)
      (define-key newmap (kbd "C-c +") nil)
      (define-key newmap (kbd "C-c -") nil)
      (make-local-variable 'minor-mode-overriding-map-alist)
      (push `(prelude-mode . ,newmap) minor-mode-overriding-map-alist)))
  (add-hook 'org-mode-hook #'prelude-org-mode-hook))

(provide 'rfnash-org-mode)
;;; rfnash-prelude-org-mode.el ends here
