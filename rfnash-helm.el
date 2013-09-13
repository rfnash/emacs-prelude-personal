;;; rfnash-helm -- My personal customization to helm

;; Copyright (C) 2013  Robert F. Nash

;; Author: Robert F. Nash <robert@robertnash.net>
;; Maintainer: Robert F. Nash <robert@robertnash.net>
;; Created: 13 Sept 2013
;; Version: 20130913-1

;;; Commentary:

;;; Code:

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

(provide 'personal)
;;; rfnash-helm.el ends here
