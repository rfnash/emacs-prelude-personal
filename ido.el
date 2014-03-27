;; old ido config for historical reference

;; use ido for minibuffer completion
;;(require 'ido)
;;(ido-mode t)
;;(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
;;(setq ido-enable-flex-matching t)
;;(setq ido-use-filename-at-point 'guess)
;;(setq ido-show-dot-for-dired t)

;; smex: a better (ido like) M-x
;;(setq smex-save-file "~/.emacs.d/.smex-items")
;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ; This is your old M-x.

;;(require 'ido-ubiquitous)
;;(ido-ubiquitous-mode 1)

;; Fix ido-ubiquitous for newer packages
;;(defmacro ido-ubiquitous-use-new-completing-read (cmd package)
;;  `(eval-after-load ,package
;;     '(defadvice ,cmd (around ido-ubiquitous-new activate)
;;	(let ((ido-ubiquitous-enable-compatibility nil))
;;	  ad-do-it))))

;; (ido-ubiquitous-use-new-completing-read webjump 'webjump)
;; (ido-ubiquitous-use-new-completing-read yas/expand 'yasnippet)
;; (ido-ubiquitous-use-new-completing-read yas/visit-snippet-file 'yasnippet)


;;(defun recentf-ido-find-file ()
;;  "Find a recent file using ido."
;;  (interactive)
;;  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
;;    (when file
;;      (find-file file))))
;;(global-set-key (kbd "C-c f")  'recentf-ido-find-file)

;; See the following
;; org-refiling - http://kangtu.me/~kangtu/pavilion.html
;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
;; See also http://doc.norang.ca/org-mode.html#RefileSetup
;; Use IDO for both buffer and file completion and ido-everywhere to t
;;(setq org-completion-use-ido nil)
;;(setq ido-max-directory-size 100000)
;;(ido-mode (quote both))

;; (load-file "/usr/share/emacs/24.3/lisp/ido.el.gz")
