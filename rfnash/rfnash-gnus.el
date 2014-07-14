;;; rfnash-gnus --- My personal configuration for Gnus

;;; Commentary:

;;; Code:

(require 'gnus)
(require 'message)
(require 'smtpmail)
(require 'nnmail)
(require 'gnus-start)
(require 'gnus-art)
(require 'face-remap)
(require 'gnus-dup)
(require 'wrap-to-fill)
(require 'mu4e-utils)


(setq gnus-select-method '(nntp "news.gwene.org"))

(add-to-list 'gnus-secondary-select-methods
             '(nnimap "rfnash@openmailbox.org"
                      (nnimap-address "imap.openmailbox.org")
                      (nnimap-server-port 143)
                      (nnimap-user "rfnash@openmailbox.org")
                      (nnimap-stream starttls)))

(add-to-list 'gnus-secondary-select-methods
             '(nnimap "robertnash@openmailbox.org"
                      (nnimap-address "imap.openmailbox.org")
                      (nnimap-server-port 143)
                      (nnimap-user "robertnash@openmailbox.org")
                      (nnimap-stream starttls)))

(add-to-list 'gnus-secondary-select-methods
             '(nnimap "musicmaker1118@gmail.com"
                      (nnimap-address "imap.gmail.com")
                      (nnimap-user "musicmaker1118@gmail.com")))

(add-to-list 'gnus-secondary-select-methods
             '(nnimap "localhost"
                      (nnimap-stream ssl)))

(add-to-list 'gnus-secondary-select-methods
             '(nnimap "outlook"
                      (nnimap-address "imap-mail.outlook.com")
                      (nnimap-user "rfnash@outlook.com")))

(add-to-list 'gnus-secondary-select-methods
             '(nnimap "robertnash.net"
                      (nnimap-address "imap.gmail.com")
                      (nnimap-user "robert@nash.co.vu")))

;;(setq message-send-mail-function 'smtpmail-send-it
;;      smtpmail-auth-credentials '(("localhost" 25 "rfnash" nil))
;;      smtpmail-default-smtp-server "localhost"
;;      smtpmail-smtp-server "localhost"
;;      smtpmail-smtp-service 25)

(setq message-send-mail-function 'message-send-mail-with-sendmail)

;; This is needed to allow msmtp to do its magic:
(setq message-sendmail-f-is-evil 't)
(setq sendmail-program "msmtp")
(setq message-sendmail-extra-arguments '("--read-envelope-from" "-t"))

;;(setq message-send-mail-function 'smtpmail-send-it
;;      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "robert@nash.co.vu" nil))
;;      smtpmail-default-smtp-server "smtp.gmail.com"
;;      smtpmail-smtp-server "smtp.gmail.com"
;;      smtpmail-smtp-service 587)

;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

(defun my-fmt-width ()
  "Find the width of the current window in the current font size."
  (interactive)
  (ceiling (/ (window-width) (expt text-scale-mode-step text-scale-mode-amount))))
;; TODO: make interative, and allow entering a width,
;; still defaulting to calculated one
(defun my-fmt ()
  "Wash Gnus Articles by wrapping words to my liking."
  (interactive)
  (save-excursion
    (gnus-article-fill-cited-article (my-fmt-width))
    (gnus-article-strip-trailing-space)))
(define-key gnus-article-mode-map (kbd "\\") 'my-fmt)

(defun rfnash-gnus-article-mode-hook ()
  "Increase font size and set wrap-to-fill-column-mode for Gnus Articles."
  (interactive)
  (text-scale-set 3)
  (set-fill-column (floor (* (frame-width) 0.72 )))
  (wrap-to-fill-column-mode t))

(add-hook 'gnus-article-mode-hook 'rfnash-gnus-article-mode-hook)
;;(add-hook 'gnus-get-top-new-news-hook (lambda () (mu4e-update-mail-and-index nil)))
(setq nnmail-expiry-wait 'immediate)
(setq gnus-group-default-list-level 3)
(setq gnus-save-duplicate-list t)
(setq gnus-summary-line-format "%U%R%z[%i]%I%(%[%4L: %-23,23f%]%) %s\n")
(setq gnus-suppress-duplicates t)
(setq gnus-view-pseudos 'not-confirm)

(setq user-full-name "Robert F. Nash")
(setq user-mail-address "robert@robertnash.net")

(add-hook 'kill-emacs-hook 'gnus-group-exit)

(provide 'rfnash-gnus)
;;; rfnash-gnus.el ends here
