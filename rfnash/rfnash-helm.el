;;; rfnash-helm -- My personal customization to helm

;; Copyright (C) 2013  Robert F. Nash

;; Author: Robert F. Nash <robert@robertnash.net>
;; Maintainer: Robert F. Nash <robert@robertnash.net>
;; Created: 13 Sept 2013
;; Version: 20130913-1

;;; Commentary:

;;; Code:

(require 'helm)
(require 'helm-config)

;; Doesn't override ido for find files, but does for C-h f, so perfect
(helm-mode 1)

;; I prefer helm over smex
(global-set-key (kbd "M-x") 'helm-M-x)

;; not sure if I really want to enable or not
;; (add-hook 'eshell-mode-hook
;;           #'(lambda ()
;;               (define-key eshell-mode-map
;;                 [remap eshell-pcomplete]
;;                 'helm-esh-pcomplete)))

(global-set-key (kbd "C-x c o") 'helm-occur)

;; Doesn't play well with gnus
;;(setq helm-split-window-in-side-p t)


;; added (find-file . ido) as I prefer ido's find-file interface to helm's,
;; but prefer helm for everything else.
(add-to-list 'helm-completing-read-handlers-alist '(find-file . ido))
(add-to-list 'helm-completing-read-handlers-alist '(switch-to-buffer . ido))

;; Increased from 0.1 to 0.5 (the value used by org-occur-goto)
;; because of the long time it takes to search
(setq helm-m-occur-idle-delay 0.5)

(require 'ido)
(setq ido-everywhere t)
(setq ido-ignore-buffers helm-boring-buffer-regexp-list)
(ido-mode 1)

(provide 'rfnash-helm)
;;; rfnash-helm.el ends here
