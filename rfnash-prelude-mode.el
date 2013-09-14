;;; rfnash-prelude-mode.el --- Emacs Prelude: minor mode

;;; Commentary:

;;; Code:

(require 'prelude-mode)

(defun rfnash-switch-buffer (buffer)
  "Switch to BUFFER using elscreen if possible;
if not, use 'switch-to-buffer-other-window'"
  (if (fboundp 'elscreen-find-and-goto-by-buffer)
      (elscreen-find-and-goto-by-buffer buffer t)
    (switch-to-buffer buffer)))

(defun visit-org-notes-buffer ()
  "Visit my notes.org buffer."
  (interactive)
  (if (get-buffer "notes.org")
      (rfnash-switch-buffer "notes.org")))

(defun visit-org-agenda-buffer ()
  "Create or visit 'org-mode' agenda buffer."
  (interactive)
  (if (get-buffer "*Org Agenda*")
      (rfnash-switch-buffer "*Org Agenda*")
    (org-agenda)))

(define-key prelude-mode-map (kbd "C-c i") 'prelude-ido-goto-symbol)
(define-key prelude-mode-map (kbd "C-c o") 'visit-org-notes-buffer)
(define-key prelude-mode-map (kbd "C-c O") 'prelude-open-with)
(define-key prelude-mode-map (kbd "C-c h") 'visit-org-agenda-buffer)
(define-key prelude-mode-map (kbd "C-x c h") 'helm-prelude)

(provide 'rfnash-prelude-mode)
;;; rfnash-prelude-mode.el ends here
