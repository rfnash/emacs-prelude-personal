;;; Personal -- My personal customization to prelude

;; Copyright (C) 2013  Robert F. Nash

;; Author: Robert F. Nash <robert@robertnash.net>
;; Maintainer: Robert F. Nash <robert@robertnash.net>
;; Created: 11 Sept 2013
;; Version: 20130911-1
;;  LocalWords:  robertnash robert emacs LocalWords

;;; Commentary:

;; So far, just set up the old-fashioned Solarized color theme
;; Could be a coincidence, but since adding Solarized,
;; but I can't get 'emacs --daemon' to work

;;; Code:

(disable-theme 'zenburn)

(prelude-require-packages '(color-theme-solarized color-theme-buffer-local))
(require 'color-theme)

;;; Included for historical interest:

;;I rarely use emacs in a terminal.
;;(if window-system
;;    (color-theme-solarized-light)
;;  (color-theme-solarized-dark))))

;; Newer version of solarized color-theme; don't care for
;; (solarized-theme
;;  (progn
;;       (if window-system
;;           (load-theme 'solarized-light t)
;;         (load-theme 'solarized-dark t))))

;; I no longer use elscreen
;; (elscreen
;;  (progn (require 'elscreen)
;;            (elscreen-start)))

(global-set-key (kbd "C-x c o") 'helm-occur)

(color-theme-solarized-light)
(require 'color-theme-buffer-local)

;;; My org config
;;; TODO: was naively copied into my prelude config, check for redundancy

(require 'org)
(require 'remember)
(setq org-modules                     ; http://orgmode.org/worg/org-contrib/
      (quote (
              ;; http://julien.danjou.info/projects/emacs-packages#org-contacts
              ;; org-contacts
              ;; http://orgmode.org/worg/org-contrib/org-depend.html
              ;; org-depend
              ;; http://orgmode.org/worg/org-contrib/org-index.html
              ;; org-index
              ;; http://www.emacswiki.org/emacs/org-search-goto.el
              ;; org-occur-goto
              ;; org-search-goto
              ;; http://www.emacswiki.org/emacs/org-search-goto-ml.el
              ;; org-search-goto-ml
              org-annotate-file      ;
              org-bibtex             ; export bibtex fragments
              org-bookmark           ;
              ;; http://orgmode.org/worg/org-contrib/org-choose.html
              org-choose             ;
              ;; http://orgmode.org/worg/org-contrib/org-collector.html
              org-collector          ;
              org-ctags              ;
              org-gnus               ;
              org-habit              ;
              org-id                 ;
              org-json               ;
              org-learn              ;
              org-mouse              ;
              ;; http://orgmode.org/worg/org-contrib/org-protocol.html
              org-protocol           ;
              org-registry           ;
              ;; http://juanreyero.com/article/emacs/org-teams.html
              org-secretary          ;
              org-toc                ;
              ;; http://orgmode.org/worg/org-contrib/org-track.html
              org-track              ;
              ;; http://orgmode.org/worg/org-contrib/org-velocity.html
              org-velocity           ;
              )))
(setq
 org-directory "~/Documents/OrgMode"
 org-default-notes-file (concat org-directory "/notes.org")
 ;; org-mobile-use-encryption t
 org-mobile-directory "~/Dropbox/MobileOrg"
 org-mobile-inbox-for-pull (concat org-directory "from-mobile.org")
 org-habit-graph-column 50
 org-capture-templates '(("b" "Bookmarks to file"
                          entry ( file+olp org-default-notes-file "TODO To File")
                          "* %a %?\n%U")
                         ("t" "Task"
                          entry ( file+olp org-default-notes-file "Tasks")
                          "* TODO %?\n%U")
                         ("d" "Design Examples"
                          entry (file+olp org-default-notes-file
                                          "Health" "Mental" "Learning" "Writing"
                                          "Publishing/Typesetting"
                                          "Web" "Examples")
                          "* %a %? :GoodDesign:\n%U")
                         ("k" "Book to read"
                          entry ( file+olp org-default-notes-file "Projects"
                                           "Books to Read")
                          "* TODO %?\n%U")
                         ("w" "To Watch"
                          entry ( file+olp org-default-notes-file "Projects"
                                           "To Watch")
                          "* TODO %?\n%U"))
 ;; org-capture-templates (("c" "Jac" entry (file+datetree "~/cjr/jac/jac.org")
 ;; "* %^{Title}  :blog:
 ;;  :PROPERTIES:
 ;;  :on: %T
 ;;  :END:
 ;;  %?
 ;;  %x"))
 org-agenda-files (list     ; Can be set using C-c [ and C-c ] in org-mode
                   (concat org-directory "/notes.org")
                   (concat org-directory "/busybox.org")
                   (concat org-directory "/plover.org"))
 org-agenda-custom-commands '(("n" "Agenda and all TODO's"
                               ((agenda "")
                                (todo "TODO")))
                              ("v" "Videos to watch"
                               tags "CATEGORY=\"ToWatch\"" nil)))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key (kbd "C-c v") 'org-velocity-read)
(global-set-key (kbd "C-c F") 'oog)
(require 'org-publish)
(setq org-publish-project-alist
      '(
        ("org-contents"
         :base-directory "~/org/"
         :base-extension "org"
         :publishing-directory "~/public_html/org-site/"
         :recursive t
         :publishing-function org-publish-org-to-html
         :table-of-contents nil
         :section-numbers nil
         ;;:author nil
         ;;:creator-info nil
         :html-postamble nil
         :auto-sitemap t
         )
        ("org" :components ("org-contents"))))
(require 'org-protocol)
;; org-refiling - http://kangtu.me/~kangtu/pavilion.html
;; Targets include this file
;; and any file contributing to the agenda - up to 9 levels deep
;; See also http://doc.norang.ca/org-mode.html#RefileSetup
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

;; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

;; Targets complete directly with IDO / Helm
(setq org-outline-path-complete-in-steps nil)

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

(provide 'personal)
;;; personal.el ends here
