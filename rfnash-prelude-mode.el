;;; rfnash-prelude-mode.el --- Emacs Prelude: minor mode

;;; Commentary:

;; Based on http://emacsredux.com/blog/2013/03/29/terminal-at-your-fingertips/

;;; Code:

(require 'prelude-mode)

(defun rfnash-switch-buffer (buffer)
  "Switch to BUFFER using elscreen if possible;
if not, use 'switch-to-buffer-other-window'"
  (if (fboundp 'elscreen-find-and-goto-by-buffer)
      (elscreen-find-and-goto-by-buffer buffer t)
    (switch-to-buffer buffer)))

(defun rfnash-visit-org-notes-buffer ()
  "Visit my notes.org buffer."
  (interactive)
  (if (get-buffer "notes.org")
      (rfnash-switch-buffer "notes.org")))

(defun rfnash-visit-org-agenda-buffer ()
  "Create or visit 'org-mode' agenda buffer."
  (interactive)
  (if (get-buffer "*Org Agenda*")
      (rfnash-switch-buffer "*Org Agenda*")
    (org-agenda)))

(defun rfnash-visit-term-buffer ()
  "Create or visit term buffer."
  (interactive)
  (if (get-buffer "*ansi-term*")
      (rfnash-switch-buffer "*ansi-term*")
    (ansi-term "tmux-attach")))

(defun rfnash-visit-eshell-buffer ()
  "Create or visit an eshell buffer."
  (interactive)
  (if (get-buffer "*eshell*")
      (rfnash-switch-buffer "*eshell*")
    (eshell)))

(defun rfnash-visit-gnus-buffer ()
  "Create or visit GNUS's group buffer."
  (interactive)
  (if (get-buffer "*Group*")
      (rfnash-switch-buffer "*Group*")
    (gnus)))

(defun rfnash-visit-scratch-buffer ()
  "Visit *scratch* buffer."
  (interactive)
  (if (get-buffer "*scratch*")
      (rfnash-switch-buffer "*scratch*")
    (if (fboundp 'elscreen-create)
	(elscreen-create)
      (progn
	(switch-to-buffer (get-buffer-create "*scratch*"))
	(lisp-interaction-mode)))))

(define-key prelude-mode-map (kbd "C-c i") 'prelude-ido-goto-symbol)
(define-key prelude-mode-map (kbd "C-c o") 'rfnash-visit-org-notes-buffer)
(define-key prelude-mode-map (kbd "C-c O") 'prelude-open-with)
(define-key prelude-mode-map (kbd "C-c h") 'rfnash-visit-org-agenda-buffer)
(define-key prelude-mode-map (kbd "C-x c h") 'helm-prelude)
(define-key prelude-mode-map (kbd "C-c g") 'rfnash-visit-gnus-buffer)
(define-key prelude-mode-map (kbd "C-c G") 'prelude-google)
(define-key prelude-mode-map (kbd "C-c s") 'rfnash-visit-scratch-buffer)
(define-key prelude-mode-map (kbd "C-c S") 'prelude-swap-windows)

;; (global-set-key "\C-cT" 'rfnash-visit-term-buffer)
;; (global-set-key "\C-ct" 'rfnash-visit-eshell-buffer)

(provide 'rfnash-prelude-mode)
;;; rfnash-prelude-mode.el ends here
