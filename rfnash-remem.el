;;; rfnash-remem --- My rememberance agent configuration

;;; Commentary:

;;; Code:

(require 'prelude-mode)
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")
(define-key prelude-mode-map (kbd "C-c r") nil)
(define-key global-map (kbd "C-c r") nil)
;; (setq remem-scopes-list '(("mail" 6 5 500)
;;                           ("notes" 2 5 500)))
(setq remem-scopes-list '(("mail" 6 5 500)))
(load "remem")

(provide 'rfnash-remem)
;;; rfnash-remem.el ends here
