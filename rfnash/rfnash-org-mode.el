;;; package --- My org-mode config

;;; Commentary:

;;; Code:

(require 'org)
(require 'use-package)
(defun rfnash-show-all ()
  "Unfold all headings and show everything except drawers and archived subtrees"
  (interactive)
  (show-all)
  (if org-hide-block-startup (org-hide-block-all))
  (org-set-visibility-according-to-property 'no-cleanup)
  (org-cycle-hide-archived-subtrees 'all)
  (org-cycle-hide-drawers 'all)
  (org-cycle-show-empty-lines t))
(setq org-startup-folded t
      ;; org-blank-before-new-entry
      ;; org-global-properties '(("Effort_ALL" . "0 0:02 0:05 0:10 0:15 0:20 0:30 0:45 1:00 2:00"))
      org-startup-indented t        ; Appears to slow down org-mode
      org-hide-leading-stars t      ; Looks a bit funny without indent
      org-log-done t
      org-log-into-drawer t
      org-return-follows-link t
      org-journal-dir "~/Documents/OrgMode/journal/"
      org-directory "~/Documents/OrgMode"
      org-default-notes-file (concat org-directory "/notes.org")
      org-return-follows-link t
      org-enforce-todo-dependencies t
      org-tags-exclude-from-inheritance '("project")
      org-columns-default-format "%40ITEM(Task) %TODO %3PRIORITY %TAGS %17Effort(Estimated Effort){:} %5CLOCKSUM")
(setq org-agenda-columns-add-appointments-to-effort-sum t
      org-agenda-dim-blocked-tasks t
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-deadline-is-shown nil
      org-agenda-skip-scheduled-if-done t
      org-agenda-span 'day
      org-agenda-sticky t
      org-agenda-window-setup 'current-window)
(setq org-sort-agenda-notime-is-late t
      org-agenda-sorting-strategy
      '((agenda time-up habit-down timestamp-up priority-down category-keep)
        ;; (agenda time-up habit-down priority-down)
        (todo priority-down category-keep)
        (tags priority-down category-keep)
        (search category-keep)))
(setq org-agenda-files
      (list org-directory
            (concat org-directory "/backlog")
            "~/Dropbox/notes"
            "~/Dropbox/Projects/learning.org"
            "~/Dropbox/Orgzly"
            "~/.emacs.d/prelude/personal/rfnash/personal.org"))
(setq org-stuck-projects '("+project/-DONE" ("TODO" "NEXT") nil ""))
(setq org-agenda-custom-commands
      '(("n" "Agenda and all NEXT actions"
         ((agenda "")
          (todo "NEXT" nil))
         ((org-agenda-tag-filter-preset '("-noagenda" "-drill"))))
        ("d" "Upcoming deadlines"
         agenda ""
         ((org-agenda-time-grid nil)
          (org-deadline-warning-days 36500)
          (org-agenda-entry-types '(:deadline))))
        ("v" "Videos to watch"
         tags "CATEGORY=\"ToWatch\"" nil)
        ;; TODO: consider only including those not under the appropriate level 1 heading
        ("f" "Bookmarks to file"
         ((todo "FILE")))
        ("u" "Upcoming next tasks"
         tags-todo "NEXT" nil)
        ("p" "Next actions of my projects"
         tags-todo "project" nil)
        ("i" "Ideas"
         ((todo "IDEA")))
        ("r" . "Review Toodledo Tasks")
        ("rt" "Review Toodledo Active tasks"
         ((todo "TOODLDO"))
         ((org-agenda-files '("~/Documents/OrgMode/Toodledo.org"))))
        ("rs" "Review Toodledo Someday tasks"
         ((todo "SOMEDAY"))
         ((org-agenda-files '("~/Documents/OrgMode/Toodledo.org"))))
        ))
(setq org-agenda-time-grid
      '((daily today require-timed)
        #("----------------" 0 16
          (org-heading t))
        (800 1000 1200 1400 1600 1800 2000)))
(setq org-capture-templates
      '(("a" "Article"
         entry (id "1c5d07ad-8ba3-4db9-b3ae-3f4441cf51ca")
         "* TODO %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ("b" "Bookmarks to file"
         entry (file "~/Documents/OrgMode/Tasks.org")
         "* FILE %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ("B" "Bookmarks to file (with link annotation)"
         entry (id "3693c528-9bfb-43c4-91e3-d68550fc4799")
         "* FILE %?%a\n:PROPERTIES:\n:CREATED:  %U\n:END:"
         :immediate-finish t)
        ("H" "Scheduled Task"
         entry (file "~/Documents/OrgMode/Tasks.org")
         "* SCHED %?\nSCHEDULED: %t")
        ("d" "Design Examples"
         entry (id  "756f3a10-f323-409b-b418-00074ba93de9")
         "* %? :GoodDesign:\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ("D" "Task with a deadline"
         entry ( file+datetree "~/Documents/OrgMode/agenda.org")
         "* TODO %?\nDEADLINE: %t\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ("h" "Habbit"
         entry ( id "b8e8b020-2772-4028-b209-1a52d3cb2fe6")
         "* HABIT %?\n:PROPERTIES:\n:STYLE: habit\n:END:")
        ("j" "Datetree entry"
         entry ( file+datetree "~/Documents/OrgMode/agenda.org")
         "* %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ("J" "Clocked entry"
         entry ( file+datetree "~/Documents/OrgMode/agenda.org")
         "* %?\n%U"
         :clock-in t
         :clock-keep t)
        ("k" "Book to read"
         entry ( id "31b8afb4-8d11-4334-a12a-5f4490a77f3a")
         "* SOMEDAY %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ("m" "Good Song"
         table-line (id "b3a14888-312d-432e-8062-4ed352866729")
         " | %^{Title} | %^{Artist} |"
         :immediate-finish t)
        ;; ("n" "Task - Next"
        ;;  entry ( file+datetree "~/Documents/OrgMode/agenda.org")
        ;;  "* NEXT %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ("n" "Task - Next"
         entry (id "cc694bc0-77e0-4a17-bb64-0fb33d166aec")
         "* NEXT %?\n:PROPERTIES:\n:CREATED:  %U\n:Effort: 5\n:END:")
        ("N" "Non-profit"
         entry ( id "9e1cc358-cbc6-4b72-af68-c16017986720")
         "* %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ("o" "Toodledo Task"
         entry (id "cc694bc0-77e0-4a17-bb64-0fb33d166aec")
         "* TOODLDO %?\nSCHEDULED: %t\n:PROPERTIES:\n:CREATED:  %U\n:Effort:  5\n:END:")
        ("p" "Person"
         entry ( id "fbefa010-a0a4-4915-bc7e-ce1844a5e3a5")
         "* %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ("P" "Personal"
         entry ( id "5baf8be5-b956-421a-950c-6e39c8e6d52e")
         "* %?%a\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ("s" "Scratch"
         entry ( file+datetree "~/Documents/OrgMode/agenda.org")
         "* %? :SCRATCH:\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ("S" "Sent to Kindle"
         entry ( id "baef29b1-40b5-4704-bf28-24b1898c41c9")
         "* TODO %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ("t" "Task"
         entry (file "~/Documents/OrgMode/Tasks.org")
         "* TODO %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ("T" "Task (with link annotation)"
         entry (file "~/Documents/OrgMode/Tasks.org")
         "* TODO %?%a\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ("u" "Quote"
         entry (id "67e35685-d8e5-488d-8ab2-ac36a7ee3c9a")
         "* %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ("w" "To Watch"
         entry ( id "e8e91a3d-d21b-403d-b46e-0be14a3d7c2d")
         "* TODO %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
        ;; From http://sachachua.com/blog/2014/11/using-org-mode-keep-process-journal/
        ;; ("z" "Journal entry" plain
        ;;  (file+datetree+prompt "~/Documents/OrgMode/journal.org")
        ;;  "%K - %a\n%i\n%?\n")
        ))
;; (setq org-capture-templates
;;       (("c" "Jac" entry (file+datetree "~/cjr/jac/jac.org")
;;         "* %^{Title}  :blog:
;;  :PROPERTIES:
;;  :on: %T
;;  :END:
;;  %?
;;  %x")))
(setq org-todo-keywords
      '((sequence "NEXT(n)" "TODO(t)" "TOODLDO(o)" "DELEGATED(g@)" "SOMEDAY(s)" "WAITING(w@)"
                  "|" "DONE(d!)" "CANCELLED(C@)" "REFERENCE(r)")
        (sequence "SCHED(c)" "|" "DONE(d!)")
        (sequence "HABIT(h)" "|" "DONE(d!)")
        (sequence "FILE(f)" "|")
        (sequence "IDEA(i)" "|")))
(setq org-tag-alist
      '(("@work"      . ?w)
        ("@home"      . ?h)
        ("@phone"     . ?p)
        ("@computer"  . ?c)
        ("@tofile"    . ?t)
        ("READING"    . ?r)
        ("GoodDesign" . ?d)
        ("7plus"      . ?s)
        ("SCRATCH"    . ?e)
        ("NEXT"       . ?n)
        ("anki"       . ?a)))
;; I had this set at 5, but setting Emac's timezone off by a few hours works better in practice,
;; because using this method, the completion day of habits is still recorded as when I actually did them,
;; not yesterday at 23:59
(setq org-extend-today-until 0)
(setq org-publish-project-alist
      '(("org-contents"
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
         :auto-sitemap t)
        ("org" :components ("org-contents"))))
;; See http://kangtu.me/~kangtu/pavilion.html and http://doc.norang.ca/org-mode.html#RefileSetup.
;; Targets include this file and any file contributing to the agenda - up to 9 levels deep.
(setq org-refile-targets '((nil :maxlevel . 2)
                           (org-agenda-files :maxlevel . 2))
      org-refile-use-outline-path t                    ; Use full outline paths for refile targets (for use with IDO/Helm)
      org-outline-path-complete-in-steps nil           ; Targets complete directly with IDO / Helm
      org-refile-allow-creating-parent-nodes 'confirm  ; Allow refile to create parent tasks with confirmation
      org-refile-use-cache t)
(setq flycheck-global-modes '(not org-mode)) ; Flycheck interferes with the keybinding for org-time-stamp-inactive in org-mode.
(use-package org-mobile-sync :ensure t)
(use-package org-pomodoro
  :ensure t
  :config
  (setq org-pomodoro-audio-player "mplayer"
        org-pomodoro-killed-sound-args "-volume 10"
        org-pomodoro-long-break-sound-args "-volume 10"
        org-pomodoro-short-break-sound-args "-volume 10"
        org-pomodoro-sound-args "-volume 10"
        org-pomodoro-start-sound-args "-volume 10"
        org-pomodoro-ticking-sound-args "-volume 10"))
(use-package org-trello :ensure t)
;; (use-package org-toodledo
;;   :load-path (lambda () (expand-file-name "org-toodledo" "~/.emacs.d/prelude/vendor"))
;;   :demand t
;;   :bind ("C-c x t" . org-toodledo-sync)
;;   :config
;;   (use-package http-post-simple :ensure t)
;;   (setq org-toodledo-preserve-drawers nil        ; Since I no longer sync habits, I don't need drawers synced
;;         org-toodledo-sync-new-completed-tasks t
;;         org-toodledo-userid "td52fa891b12039"
;;         org-toodledo-sync-on-save 'no
;;         org-toodledo-archive-completed-tasks nil ; Conflicts with sync-new-completed-tasks
;;         org-toodledo-archive-deleted-tasks t
;;         org-toodledo-status-to-org-map
;;         '(("Active" . "TOODLDO")
;;           ("None" . "HABIT")
;;           ("Next Action" . "NEXT")
;;           ("Planning" . "TODO")
;;           ("Delegated" . "DELEGATED")
;;           ("Waiting" . "WAITING")
;;           ("Someday" . "SOMEDAY")
;;           ("Hold" . "SOMEDAY")
;;           ("Postponed" . "SOMEDAY")
;;           ("Canceled" . "CANCELED")
;;           ("Reference" . "REFERENCE"))))
(use-package org-page
  :ensure t
  :config
  (setq op/personal-disqus-shortname "rfnash"
        op/personal-github-link "https://github.com/rfnash"
        op/repository-directory "~/git/blog.git/"
        op/repository-html-branch "gh-pages"
        op/repository-org-branch "source"
        op/site-domain "http://robertnash.net/"
        op/site-main-title "Robert Nash's Blog"
        op/site-sub-title "A sedomly updated blog"))
;; http://orgmode.org/worg/org-contrib/
;; Require all of the org-mode modules that I use.
(require 'org-annotate-file)
(require 'org-bbdb)
(require 'org-bibtex)                   ; export bibtex fragments(require '
(require 'org-bookmark)
(require 'org-checklist)
(require 'org-choose)                   ; http://orgmode.org/worg/org-contrib/org-choose.html
(require 'org-collector)                ; http://orgmode.org/worg/org-contrib/org-collector.html
(require 'org-ctags)
;; (require org-depend)                 ; http://orgmode.org/worg/org-contrib/org-depend.html
(require 'org-elisp-symbol)
(require 'org-eshell)
(require 'org-eval)
(require 'org-eval-light)
;; (require 'org-git-link)
(require 'org-gnus)
;; (require org-index)                  ; http://orgmode.org/worg/org-contrib/org-index.html
(require 'org-info)
(require 'org-inlinetask)
;;(require 'org-json)
(require 'org-learn)
(require 'org-man)
(require 'org-mouse)
;;(require 'org-mtags)
;; (require org-occur-goto)             ; http://www.emacswiki.org/emacs/org-search-goto.el
;;(require 'org-panal)
;; (require org-search-goto)            ; http://www.emacswiki.org/emacs/org-search-goto.el
;;(require org-search-goto-ml)          ;  http://www.emacswiki.org/emacs/org-search-goto-ml.el
(require 'org-secretary)                ; http://juanreyero.com/article/emacs/org-teams.html
(require 'org-toc)
(require 'org-track)                    ; http://orgmode.org/worg/org-contrib/org-track.html
(require 'org-w3m)
(require 'remember)
(use-package org-drill
  :config
  ;; (setq org-drill-optimal-factor-matrix nil)
  (setq org-drill-scope 'agenda))
(use-package org-mobile
  :config
  (setq org-mobile-directory "~/Dropbox/MobileOrg"
        ;; org-mobile-use-encryption t
        org-mobile-inbox-for-pull (concat org-directory "/from-mobile.org")))
(use-package org-id
  :config
  (setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id))
(use-package org-velocity
  :load-path "~/.emacs.d/prelude/vendor/org-velocity/org-velocity.el"
  :commands org-velocity-read
  :bind "C-x c v"
  :config (setq org-velocity-bucket "~/Documents/OrgMode/reference.org"))
(use-package org-habit
  :config
  (setq org-habit-following-days 1
        org-habit-graph-column 71
        org-habit-preceding-days 7
        org-habit-show-all-today nil
        org-habit-show-done-always-green t))
(use-package org-expiry
  :config
  (setq org-expiry-inactive-timestamps t)
  (org-expiry-insinuate))
(use-package org-contacts
  :config
  (setq org-contacts-birthday-format "Birthday: %h (%Y)"))
(use-package org-cliplink :ensure t)
(use-package org-transform-tree-table :ensure t) ; https://github.com/jplindstrom/emacs-org-transform-tree-table
;; (use-package orgbox :ensure t)
(use-package org-agenda-property
  :ensure t
  :config
  ;; (setq org-agenda-property-list '("Effort"))
  (setq org-agenda-property-list nil))

(provide 'rfnash-org-mode)
;;; rfnash-org-mode.el ends here
