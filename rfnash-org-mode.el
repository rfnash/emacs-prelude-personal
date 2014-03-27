;;; rfnash-org-mode -- My personal org-mode config

;; Copyright (C) 2013  Robert F. Nash

;; Author: Robert F. Nash <robert@robertnash.net>
;; Maintainer: Robert F. Nash <robert@robertnash.net>
;; Created: 13 Sept 2013
;; Version: 20130913-1

;;; Commentary:

;; TODO: was naively copied into my prelude config, check for redundancy

;;; Code:

;; TODO: org-mobile-sync requires unavailable package emacs 24.3.50
(prelude-require-packages '(org-dotemacs org-pomodoro org-trello))
(require 'rfnash-el-get)
(require 'org)
(org-reload)
(require 'org-agenda)                 ; add (load-library "org-compat")
(require 'org-mobile)
(require 'org-habit)
(require 'org-capture)
(require 'remember)
;; (require 'org-contacts)

;; org-toodledo is installed via git
(add-to-list 'load-path (expand-file-name "org-toodledo" prelude-vendor-dir))
(require 'org-toodledo)

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
              ;; org-contacts           ;
              org-ctags              ;
              org-gnus               ;
              org-habit              ;
              org-id                 ;
              ;; org-json               ;
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
              ;; org-velocity           ; TODO: error on load
              )))
(setq
 org-directory "~/Documents/OrgMode"
 org-default-notes-file (concat org-directory "/notes.org")
 ;; org-mobile-use-encryption t
 org-mobile-directory "~/Dropbox/MobileOrg"
 org-mobile-inbox-for-pull (concat org-directory "from-mobile.org")
 org-habit-graph-column 65
 org-capture-templates '(
                         ("b" "Bookmarks to file"
                          entry ( file+olp "~/Documents/OrgMode/notes.org"
                                           "Filing")
                          "* FILE %a %?\n%U")
                         ("t" "Task"
                          entry ( file+olp "~/Documents/OrgMode/notes.org"
                                           "Agenda"
                                           "Tasks"
                                           "Todo")
                          "* TODO %?\n%U")
                         ("n" "Task - Next"
                          entry ( file+olp "~/Documents/OrgMode/notes.org"
                                           "Agenda"
                                           "Tasks"
                                           "Next")
                          "* NEXT %?\n%U")
                         ("d" "Design Examples"
                          entry (file+olp "~/Documents/OrgMode/notes.org"
                                          "Reference"
                                          "Health"
                                          "Mental"
                                          "Learning"
                                          "Writing"
                                          "Publishing/Typesetting"
                                          "Web"
                                          "Examples")
                          "* %a %? :GoodDesign:\n%U")
                         ("k" "Book to read"
                          entry ( file+olp "~/Documents/OrgMode/notes.org"
                                           "Agenda"
                                           "Projects"
                                           "Consumption"
                                           "Books")
                          "* SOMEDAY %?\n%U")
                         ("w" "To Watch"
                          entry ( file+olp "~/Documents/OrgMode/notes.org"
                                           "Agenda"
                                           "Projects"
                                           "Consumption"
                                           "Videos")
                          "* TODO %?\n%U")
                         ("s" "Scratch"
                          entry ( file+olp "~/Documents/OrgMode/notes.org"
                                           "Scratch")
                          "* %a %?\n%U")
                         ("h" "Habbit"
                          entry ( file+olp "~/Documents/OrgMode/notes.org"
                                           "Agenda"
                                           "Habits"
                                           "Other")
                          "* HABIT %?\n:PROPERTIES:\n:STYLE: habit\n:END:")
                         ("j" "Datetree entry"
                          entry ( file+datetree "~/Documents/OrgMode/notes.org")
                          "* %a %?\n%U")
                         ("c" "Clocked entry"
                          entry ( file+datetree "~/Documents/OrgMode/notes.org")
                          "* %a %?\n%U"
                          :clock-in t
                          :clock-keep t)
                         ("T" "Scheduled Task"
                          entry ( file+olp "~/Documents/OrgMode/notes.org"
                                           "Agenda"
                                           "Tasks"
                                           "Scheduled")
                          "* SCHED %?\nSCHEDULED: %t")
                         )
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
                   (concat org-directory "/plover.org")
                   (concat org-directory "/Toodledo.org"))
 org-agenda-custom-commands '(("n" "Agenda and all NEXT actions"
                               ((agenda "")
                                (todo "NEXT")))
                              ("v" "Videos to watch"
                               tags "CATEGORY=\"ToWatch\"" nil))
 org-agenda-dim-blocked-tasks t
 org-agenda-skip-scheduled-if-deadline-is-shown t
 org-agenda-skip-scheduled-if-done t
 org-agenda-span (quote day)
 org-enforce-todo-dependencies t
 ;; org-velocity-bucket "~/Documents/OrgMode/notes.org" ; FIXME
 )
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;; (global-set-key (kbd "C-c v") 'org-velocity-read) ; FIXME
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

(require 'org-expiry)
(org-expiry-insinuate)

(provide 'rfnash-org-mode)
;;; rfnash-org-mode.el ends here
