;;; Personal -- My personal customization to prelude

;; Copyright (C) 2013  Robert F. Nash

;; Author: Robert F. Nash <robert@robertnash.net>
;; Maintainer: Robert F. Nash <robert@robertnash.net>
;; Created: 11 Sept 2013
;; Version: 20130913-1

;;; Commentary:

;;; Code:

(setq default-directory "~")

(prelude-require-package 'smart-tab)
(require 'smart-tab)
(global-smart-tab-mode 1)
(define-key read-expression-map [(tab)] 'hippie-expand)

;; I no longer use elscreen
;; (elscreen
;;  (progn (require 'elscreen)
;;            (elscreen-start)))

(prelude-require-package 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

(prelude-require-package 'emagician-fix-spell-memory)
(require 'emagician-fix-spell-memory)

(add-to-list 'load-path "/home/shared/.local/share/emacs/site-lisp")
(add-to-list 'load-path "/home/shared/.local/share/emacs/site-lisp/edb")
(require 'elip)

(prelude-require-package 'yasnippet)
(require 'yasnippet)
(yas-global-mode 1)

(prelude-require-package 'paredit)
(add-hook 'lisp-interaction-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(electric-pair-mode +1)
(electric-indent-mode +1)

(provide 'personal)
;;; personal.el ends here
