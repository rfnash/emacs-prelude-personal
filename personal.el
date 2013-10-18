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

(provide 'personal)
;;; personal.el ends here
