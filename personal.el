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

(prelude-require-package 'yasnippet)
(require 'yasnippet)
(yas-global-mode 1)

(prelude-require-package 'paredit)
(add-hook 'lisp-interaction-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(prelude-require-packages '(helm-orgcard helm-descbinds helm-backup helm-helm-commands))

(prelude-require-packages '(ag helm-ag helm-ag-r))

(prelude-require-package 'bbdb)
(setq bbdb-file "~/.emacs.d/bbdb")
(require 'bbdb)
(bbdb-initialize 'gnus 'message)
(bbdb-insinuate-message)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'kill-emacs-hook 'bbdb-save)
;;(prelude-require-package 'bbdb-vcard)

(add-to-list 'load-path (expand-file-name "helm-mu" prelude-vendor-dir))
(require 'helm-mu)

(electric-pair-mode +1)
(electric-indent-mode +1)

;; Homepage: https://github.com/swannodette/ob-sml
(prelude-require-package 'ob-sml)

;;; Old init.el for historical reference

;;(mapc 'load (directory-files "~/.emacs.d/conf.d/" t "^[^#!].*\.el$"))
;;(server-start)
;;(custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;; '(debug-on-error t)
;; '(helm-adaptative-mode t nil (helm-adaptative))
;; '(helm-adaptive-history-length 1000)
;; '(helm-ff-file-name-history-use-recentf t)
;;(custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;; '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
;; '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

;; ;; Various settings from emacs kicker
;; ;; (https://github.com/dimitri/emacs-kicker)

;; ;; on to the visual settings


;; (setq inhibit-splash-screen t)               ; no splash screen, thanks
;; (line-number-mode t)                 ; have line numbers and
;; (column-number-mode t)                       ; column numbers in the mode line

;; (tool-bar-mode -1)                           ; no tool bar with icons
;; (scroll-bar-mode -1)                 ; no scroll bars
;; (menu-bar-mode -1)                      ; no menu bar

;; (global-hl-line-mode)                        ; highlight current line
;; (global-linum-mode 1)                        ; add line numbers on the left

;; ;; full screen
;; (defun fullscreen ()
;;   (interactive)
;;   (set-frame-parameter nil 'fullscreen
;;                     (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
;; (global-set-key [f11] 'fullscreen)

;; ;; Use the clipboard, pretty please, so that copy/paste "works"
;; (setq x-select-enable-clipboard t)

;; ;; Navigate currently visible windows with M-<arrows>
;; (windmove-default-keybindings 'meta)
;; (setq windmove-wrap-around t)

;; ;; winner-mode provides C-<left> to get back to previous window layout
;; (winner-mode 1)

;; ;; whenever an external process changes a file underneath emacs, and there
;; ;; was no unsaved changes in the corresponding buffer, just revert its
;; ;; content to reflect what's on-disk.
;; (global-auto-revert-mode 1)

;; ;; C-x C-j opens dired with the cursor right on the file you're editing
;; (require 'dired-x)

(setq browse-url-browser-function
      'browse-url-generic browse-url-generic-program "firefox")

;; (set-face-attribute 'default nil :family "Liberation Mono for Powerline" :height 120)


;; ;; From emacsredux
;; (defun eval-and-replace ()
;;   "Replace the preceding sexp with its value."
;;   (interactive)
;;   (backward-kill-sexp)
;;   (condition-case nil
;;       (prin1 (eval (read (current-kill 0)))
;;           (current-buffer))
;;     (error (message "Invalid expression")
;;         (insert (current-kill 0)))))
;; (global-set-key (kbd "C-c e") 'eval-end-replace)

;; ;; from whattheemacsd.com

;; ;; Write backup files to own directory
;; (setq backup-directory-alist
;;       `(("." . ,(expand-file-name
;;               (concat user-emacs-directory "backups")))))

;; ;; Make backups of files, even when they're in version control
;; (setq vc-make-backup-files t)

;; ;; Save point position between sessions
;; (require 'saveplace)
;; (setq-default save-place t)
;; (setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; (defun cleanup-buffer-safe ()
;;   "Perform a bunch of safe operations on the whitespace content of a buffer.
;; Does not indent buffer, because it is used for a before-save-hook, and that
;; might be bad.
;; TODO: Will screw up makefiles by changing tabs to whitespace."
;;   (interactive)
;;   ;; (untabify (point-min) (point-max))
;;   (delete-trailing-whitespace)
;;   (set-buffer-file-coding-system 'utf-8))

;; ;; Various superfluous white-space. Just say no.
;; (add-hook 'before-save-hook 'cleanup-buffer-safe)

;; (defun cleanup-buffer ()
;;   "Perform a bunch of operations on the whitespace content of a buffer.
;; Including indent-buffer, which should not be called automatically on save."
;;   (interactive)
;;   (cleanup-buffer-safe)
;;   (indent-region (point-min) (point-max)))

;; (global-set-key (kbd "C-c n") 'cleanup-buffer)

;; (global-set-key (kbd "M-j")
;;              (lambda ()
;;                (interactive)
;;                (join-line -1)))

;; (require 'recentf)
;; (setq recentf-save-file "~/.emacs.d/.recentf"
;;       recentf-max-saved-items 200)
;; (recentf-mode +1)

;; ;; Enables paredit in the minibuffer when it is used to eval a lisp
;; ;; expression with M-:
;; (defun conditionally-enable-paredit-mode ()
;;   "Enable `paredit-mode' in the minibuffer, during `eval-expression'."
;;   (if (eq this-command 'eval-expression)
;;       (paredit-mode 1)))

;; (add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)

;; ;; treat CamelCase words as seperate words for eg. deletion
;; (add-hook 'prog-mode-hook 'subword-mode)

;; (setq whitespace-global-modes '(not org-mode))
;; ;;(global-whitespace-mode)
;; (setq show-trailing-whitespace t)

(defun set-browser (browser)
  "Prompt for BROWSER to set as default."
  (interactive "sBrowser: ")
  (setq browse-url-browser-function
        'browse-url-generic browse-url-generic-program browser))

;; (defun htop ()
;;   "Start htop in its own buffer."
;;   (interactive)
;;   (ansi-term "htop" "htop"))

;; (defun mixer ()
;;   "Start alsamixer in its own buffer"
;;   (interactive)
;;   (ansi-term "alsamixer" "mixer"))

;;(require 'org-page)

(setq gnus-init-file (expand-file-name "rfnash-gnus.el" prelude-personal-dir))

(provide 'personal)
;;; personal.el ends here
