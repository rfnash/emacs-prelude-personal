;;; rfnash-el-get -- Install and configure various packages through el-get

;; Copyright (C) 2013  Robert F. Nash

;; Author: Robert F. Nash <robert@robertnash.net>
;; Maintainer: Robert F. Nash <robert@robertnash.net>
;; Created: 11 Sept 2013
;; Version: 20130913-1

;;; Commentary:

;;; Code:

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(require 'el-get nil t)                       ; to appease flycheck
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.

;; set local recipes
(setq
 el-get-sources
 '((:name el-get)          ; el-get is self-hosting
   (:name nxhtml)          ; for html emails and wrap-to-file-column-mode
   ;; (:name o-blog)       ; version in package.el doesn't work
   (:name pwsafe :after (setq pwsafe-primary-database "~/Dropbox/pwsafe.dat"))
   (:name org-mode)
   (:name erc-extras)
   (:name ledger-mode)
   (:name babel)
   (:name emacs-http-server)))


;; Adds packages from local recipes above
(setq my:el-get-packages
      (loop for src in el-get-sources collect (el-get-source-name src)))

;; install new packages and init already installed packages
(el-get 'sync my:el-get-packages)

(provide 'rfnash-el-get)
;;; rfnash-el-get.el ends here
