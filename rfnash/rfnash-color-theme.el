;;; rfnash-color-theme -- My settings to use the solarized light color theme

;; Copyright (C) 2013  Robert F. Nash

;; Author: Robert F. Nash <robert@robertnash.net>
;; Maintainer: Robert F. Nash <robert@robertnash.net>
;; Created: 13 Sept 2013
;; Version: 20130913-1

;;; Commentary:

;; Set up the old-fashioned Solarized color theme
;; and set ansi-term to use solarized dark colors

;; Could be a coincidence, but since adding Solarized,
;; but I can't get 'Emacs --daemon' to work

;;; Code:

(prelude-require-packages '(solarized-theme load-theme-buffer-local color-theme color-theme-buffer-local color-theme-solarized))

(setq light t)           ; setting to t works and remove undefined var error
;;(load-theme 'solarized-light t)
;;(if (display-graphic-p)
;;    (load-theme 'solarized-light t)
;;  (load-theme 'solarized-dark t))

(disable-theme 'zenburn)
(require 'color-theme)
(color-theme-solarized-light)

(set-face-attribute 'default nil :family "Liberation Mono for Powerline" :height 120)

;;; ansi-term solarized settings

(require 'term)
(setq term-mode-hook '((lambda nil
                         ;; To use new deftheme instead of color-theme
                         ;;                         (load-theme-buffer-local
                         ;;                         'solarized-dark
                         ;;                          (current-buffer)
                         ;;                          t)))

                         ;; (color-theme-buffer-local
                         ;;  (quote color-theme-solarized-dark)
                         ;;  (current-buffer))
                         (setq-local dark t)
                         (load-theme-buffer-local
                          'solarized-dark
                          (current-buffer) t nil)))
      term-scroll-to-bottom-on-output t)

;; TODO: is probably a bad idea to set this here. Find a better way.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(term ((t (:inherit default :background "#002b36"))))
 '(term-bold ((t (:inverse-video t :weight bold))))
 '(term-color-black ((t (:background "#002b36" :foreground "#073642"))))
 '(term-color-blue ((t (:background "#002b36" :foreground "#268bd2"))))
 '(term-color-cyan ((t (:background "#002b36" :foreground "#2aa198"))))
 '(term-color-green ((t (:background "#002b36" :foreground "#859900"))))
 '(term-color-magenta ((t (:background "#002b36" :foreground "#d33682"))))
 '(term-color-red ((t (:background "#002b36" :foreground "#dc322f"))))
 '(term-color-white ((t (:background "#002b36" :foreground "#eee8d5"))))
 '(term-color-yellow ((t (:background "#002b36" :foreground "#b58900")))))

(provide 'rfnash-color-theme)
;;; rfnash-color-theme ends here
