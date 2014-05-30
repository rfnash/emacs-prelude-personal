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
    (org-agenda nil "n")))

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

(defun rfnash-visit-mu4e-buffer ()
  "Create or visit mu4e's main buffer."
  (interactive)
  (if (get-buffer "*mu4e-main*")
      (rfnash-switch-buffer "*mu4e-main*")
    (mu4e)))

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

;; From http://stackoverflow.com/a/1249665
(defun my-horizontal-recenter ()
  "Make the point horizontally centered in the window."
  (interactive)
  (let ((mid (/ (window-width) 2))
        (line-len (save-excursion (end-of-line) (current-column)))
        (cur (current-column)))
    (if (< mid cur)
        (set-window-hscroll (selected-window)
                            (- cur mid)))))

(defun rfnash-scroll-left-edge ()
  "Like `my-horizontal-recenter', but place point at the left edge of the window."
  (interactive)
  (set-window-hscroll (selected-window) (current-column)))

(global-set-key (kbd "C-c x l") 'rfnash-scroll-left-edge)
(global-set-key (kbd "C-S-L") 'rfnash-scroll-left-edge)

(defun browse-weather ()
  "Look up the current weather on forecast.io."
  (interactive)
  (browse-url "http://forecast.io/"))

(define-key prelude-mode-map (kbd "C-x F") 'browse-weather)

(define-key prelude-mode-map (kbd "C-c i") 'prelude-ido-goto-symbol)
(define-key prelude-mode-map (kbd "C-c o") 'rfnash-visit-org-notes-buffer)
(define-key prelude-mode-map (kbd "C-c O") 'prelude-open-with)
(define-key prelude-mode-map (kbd "C-c h") 'rfnash-visit-org-agenda-buffer)
(define-key prelude-mode-map (kbd "C-x c h") 'helm-prelude)
(define-key prelude-mode-map (kbd "C-c g") 'rfnash-visit-gnus-buffer)
(define-key prelude-mode-map (kbd "C-c m") 'rfnash-visit-mu4e-buffer)
(define-key prelude-mode-map (kbd "C-c G") 'prelude-google)
(define-key prelude-mode-map (kbd "C-c s") 'rfnash-visit-scratch-buffer)
(define-key prelude-mode-map (kbd "C-c S") 'prelude-swap-windows)
(define-key prelude-mode-map (kbd "C-c ;") 'comment-region)

(define-key oog-map (kbd "C-n") 'oog-next-line)
(define-key oog-map (kbd "C-p") 'oog-previous-line)
(define-key oog-map (kbd "C-v") 'oog-previous-page)
(define-key oog-map (kbd "M-v") 'oog-next-page)

(require 'gnus-art)
(define-key gnus-article-mode-map (kbd "i") 'gnus-article-show-images)
(define-key gnus-summary-mode-map (kbd "i") 'gnus-article-show-images)

;; Use C-h instead of backspace, because I disable backspace in xbindkeys
;; Long story, but purpose was to stop its use in aldo
;; TODO: this probable is a horrible idea and should be removed
(global-unset-key (kbd "C-h"))
(define-key prelude-mode-map (kbd "C-h") 'backward-delete-char-untabify)
(define-key helm-map (kbd "C-h") 'backward-delete-char)

;; TODO: kind of works, but usually ends up deleting characters
;; in the buffer I'm searching in, and not from the search string,
;; yet pressing backspace works as expected. Figure out why.
(define-key isearch-mode-map (kbd "C-h") 'backward-delete-char)

;; (global-set-key "\C-cT" 'rfnash-visit-term-buffer)
;; (global-set-key "\C-ct" 'rfnash-visit-eshell-buffer)

(provide 'rfnash-prelude-mode)
;;; rfnash-prelude-mode.el ends here
