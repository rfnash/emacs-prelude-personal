;; old ELPA package config for historical interest

;;(require 'package)
;;(add-to-list 'package-archives
;;	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives
;;	     '("org" . "http://orgmode.org/elpa/") t)
;;(add-to-list 'package-archives
;;	     '("tromey" . "http://tromey.com/elpa/") t)
;;(add-to-list 'package-archives
;;	     '("gnu" . "http://elpa.gnu.org/packages/") t)
;;(add-to-list 'package-archives
;;	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
;;(package-initialize)

;;(when (not package-archive-contents)
;;  (package-refresh-contents))

;;(defvar my-packages '((cl-lib)
;;		      (bbdb
;;		       (progn
;;			 (setq bbdb-file "~/.emacs.d/bbdb")
;;			 (require 'bbdb)
;;			 (bbdb-initialize 'gnus 'message)
;;			 (bbdb-insinuate-message)
;;			 (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
;;			 (setq bbdb-send-mail-style 'gnus)
;;			 (setq bbdb-complete-name-full-completion t)
;;			 (setq bbdb-completion-type 'primary-or-name)
;;			 (setq bbdb-complete-name-allow-cycling t)
;;			 (setq bbdb-offer-save 1
;;			       bbdb-use-pop-up t
;;			       bbdb-electric-p t
;;			       bbdb-popup-target-lines  1)))
;;		      ;;(bbdb-vcard)
;;		      (emms)
;;		      (deft
;;			(progn
;;			  ;; deft: homepage: http://jblevins.org/projects/deft/
;;			  ;; also http://www.emacswiki.org/emacs/DeftMode
;;			  (setq deft-extension "org")
;;			  (setq deft-text-mode 'org-mode)
;;			  (setq deft-directory "~/Dropbox/notes")
;;			  (global-set-key [f8] 'deft) ; (setq deft-use-filename-as-title t)
;;			  ))
;;		      (evil)
;;		      (linum-off
;;		       (require 'linum-off))	      ; linum slows down org-mode
;;		      (quack)
;;		      (geiser)
;;		      (puppet-mode)
;;		      (bitlbee (require 'bitlbee))
;;		      (rainbow-delimiters (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
;;		      (powerline)
;;		      (htmlize)	                      ; required by org-mode html export
;;		      (helm-ag)
;;		      (w3m)
;;		      (elixir-mode)
;;		      (flymake-easy)	              ; required by flymake-elixir
;;		      (flymake-elixir
;;		       (progn
;;			 (add-hook 'find-file-hook 'flymake-find-file-hook)
;;			 (require 'flymake-elixir)
;;			 (add-hook 'elixir-mode-hook 'flymake-elixir-load)))
;;		      (smart-tab                      ; indents or completes, inteligently
;;		       (progn
;;			 (require 'smart-tab)
;;			 (global-smart-tab-mode 1)
;;			 (define-key read-expression-map [(tab)] 'hippie-expand)))
;;		      (nrepl                          ;  see https://github.com/kingtim/nrepl.el
;;		       (progn
;;			 (add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
;;			 (setq nrepl-hide-special-buffers t)
;;			 (add-to-list 'same-window-buffer-names "*nrepl*")
;;			 (add-hook 'nrepl-mode-hook 'subword-mode)
;;			 (add-hook 'nrepl-mode-hook 'paredit-mode)
;;			 (add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)))
;;		      (auctex)
;;		      (auctex-latexmk)
;;		      (ioccur)                       ; not sure if i like better than helm-occur or not
;;		      (switch-window)
;;		      (goto-last-change)
;;		      (org-page))
;;"A list of packages to ensure are installed at launch.")

;;(dolist (p my-packages)
;;  (progn
;;    (when (not (package-installed-p (car p)))
;;      (package-install (car p)))
;;    (eval (cadr p))))

;;(custom-set-faces
;; '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
;; '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
