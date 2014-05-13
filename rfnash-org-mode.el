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
(require 'org-drill)
(require 'org-expiry)
;; (require 'org-contacts)

;; org-toodledo is installed via git
(add-to-list 'load-path (expand-file-name "org-toodledo" prelude-vendor-dir))
(require 'org-toodledo)
(setq org-toodledo-preserve-drawers t)

(setq
 op/personal-disqus-shortname "rfnash"
 op/personal-github-link "https://github.com/rfnash"
 op/repository-directory "~/git/blog.git/"
 op/repository-html-branch "gh-pages"
 op/repository-org-branch "source"
 op/site-domain "http://robertnash.net/"
 op/site-main-title "Robert Nash's Blog"
 op/site-sub-title "A sedomly updated blog")

'(org-refile-use-cache t)
'(org-return-follows-link t)
'(org-sort-agenda-notime-is-late nil)

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
              org-annotate-file         ;
              org-bibtex                ; export bibtex fragments
              org-bbdb                  ;
              org-bookmark              ;
              org-checklist             ;
              ;; http://orgmode.org/worg/org-contrib/org-choose.html
              org-choose                ;
              ;; http://orgmode.org/worg/org-contrib/org-collector.html
              org-collector             ;
              ;; org-contacts           ;
              org-ctags                 ;
              org-drill                 ;
              org-elisp-symbol          ;
              org-eshell                ;
              org-eval                  ;
              org-eval-light            ;
              org-expiry                ;
              org-git-link              ;
              org-gnus                  ;
              org-habit                 ;
              org-id                    ;
              org-info                  ;
              org-inlinetask            ;
              ;; org-json               ;
              org-learn                 ;
              org-man                   ;
              org-mouse                 ;
              ;; http://orgmode.org/worg/org-contrib/org-protocol.html
              org-panal                 ;
              org-protocol              ;
              org-mtags                 ;
              org-registry              ;
              ;; http://juanreyero.com/article/emacs/org-teams.html
              org-secretary             ;
              org-toc                   ;
              ;; http://orgmode.org/worg/org-contrib/org-track.html
              org-track                 ;
              ;; http://orgmode.org/worg/org-contrib/org-velocity.html
              ;; org-velocity           ; TODO: error on load
              org-w3m                   ;
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
                          entry ( file+datetree "~/Documents/OrgMode/notes.org")
                          "* FILE %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("t" "Task"
                          entry ( file+datetree "~/Documents/OrgMode/notes.org")
                          "* TODO %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("n" "Task - Next"
                          entry ( file+datetree "~/Documents/OrgMode/notes.org")
                          "* NEXT %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("d" "Design Examples"
                          entry (id  "2d9bf65f-6b2b-4e8a-81f5-b2faf22f8a6f")
                          "* %? :GoodDesign:\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("k" "Book to read"
                          entry ( id "31b8afb4-8d11-4334-a12a-5f4490a77f3a")
                          "* SOMEDAY %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("w" "To Watch"
                          entry ( id "e8e91a3d-d21b-403d-b46e-0be14a3d7c2d")
                          "* TODO %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("S" "Sent to Kindle"
                          entry ( id "baef29b1-40b5-4704-bf28-24b1898c41c9")
                          "* TODO %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("s" "Scratch"
                          entry ( file+datetree "~/Documents/OrgMode/notes.org")
                          "* %? :SCRATCH:\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("h" "Habbit"
                          entry ( id "b8e8b020-2772-4028-b209-1a52d3cb2fe6")
                          "* HABIT %?\n:PROPERTIES:\n:STYLE: habit\n:END:")
                         ("j" "Datetree entry"
                          entry ( file+datetree "~/Documents/OrgMode/notes.org")
                          "* %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("c" "Clocked entry"
                          entry ( file+datetree "~/Documents/OrgMode/notes.org")
                          "* %?\n%U"
                          :clock-in t
                          :clock-keep t)
                         ("T" "Scheduled Task"
                          entry ( file+olp "~/Documents/OrgMode/notes.org"
                                           "Agenda"
                                           "Tasks"
                                           "Scheduled")
                          "* SCHED %?\nSCHEDULED: %t")
                         ("p" "Person"
                          entry ( id "fbefa010-a0a4-4915-bc7e-ce1844a5e3a5")
                          "* %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("N" "Non-profit"
                          entry ( id "9e1cc358-cbc6-4b72-af68-c16017986720")
                          "* %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("o" "Toodledo Task"
                          entry ( id "bbd1b4a1-3f1a-4e97-ac45-7719edbaf700")
                          "* NEXT %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("P" "Personal"
                          entry ( id "5baf8be5-b956-421a-950c-6e39c8e6d52e")
                          "* %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
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
                               tags "CATEGORY=\"ToWatch\"" nil)
                              ;; TODO: consider only including those not under the appropriate level 1 heading
                              ("f" "Bookmarks to file"
                               ((todo "FILE"))))
 org-agenda-dim-blocked-tasks t
 org-agenda-skip-scheduled-if-deadline-is-shown t
 org-agenda-skip-scheduled-if-done t
 org-agenda-span 'day
 org-refile-use-cache t
 org-return-follows-link t
 org-sort-agenda-notime-is-late nil
 org-agenda-time-grid '((daily today require-timed)
                        #("----------------" 0 16
                          (org-heading t))
                        (800 1000 1200 1400 1600 1800 2000 2200 2259 2300))
 org-agenda-sorting-strategy '((agenda time-up habit-down priority-down category-keep)
                               (todo priority-down category-keep)
                               (tags priority-down category-keep)
                               (search category-keep))
 org-enforce-todo-dependencies t
 org-blank-before-new-entry '((heading) (plain-list-item))
 org-contacts-birthday-format "Birthday: %h (%Y)"
 ;; org-drill-optimal-factor-matrix nil
 org-expiry-inactive-timestamps t
 ;; I had this set at 5, but setting Emac's timezone off by a few hours works better in practice,
 ;; because using this method, the completion day of habits is still recorded as when I actually did them,
 ;; not yesterday at 23:59
 org-extend-today-until 0
 org-habit-following-days 1
 org-habit-graph-column 71
 org-habit-preceding-days 7
 org-habit-show-all-today nil
 org-habit-show-done-always-green t
 org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id
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
