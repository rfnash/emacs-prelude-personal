;;; rfnash-mu4e --- My personal mu4e config

;;; Commentary:

;;; Code:

(add-to-list 'load-path (expand-file-name "mu/mu4e" prelude-vendor-dir))
(require 'mu4e)
(setq mu4e-mu-binary "/usr/local/bin/mu"   ;; use local version of mu
      mu4e-maildir       "~/Maildir"       ;; top-level Maildir
      mu4e-sent-folder   "/Sent"           ;; folder for sent messages
      mu4e-drafts-folder "/Drafts"         ;; unfinished messages
      mu4e-trash-folder  "/Trash"          ;; trashed messages
      mu4e-refile-folder "/archive"        ;; saved messages
      mu4e-get-mail-command "")
(add-to-list 'mu4e-view-actions
                                        ; Open message in external browser with 'x' as the shortcut
             '("xview in browser" . mu4e-action-view-in-browser) t)
(add-hook 'mu4e-view-mode-hook 'wrap-to-fill-column-mode)

(provide 'rfnash-mu4e)
;;; rfnash-mu4e.el ends here
