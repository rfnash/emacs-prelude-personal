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
(prelude-require-packages '(org-pomodoro org-trello))
(require 'rfnash-el-get)
(add-to-list 'load-path "~/.local/share/emacs/site-lisp/org")
(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp")
(load-file "~/.local/share/emacs/site-lisp/org/org-compat.el")
(require 'org)
(require 'rfnash-org-modules)

;; org-toodledo is installed via git
(add-to-list 'load-path (expand-file-name "org-toodledo" prelude-vendor-dir))
(require 'org-toodledo)
(setq org-toodledo-preserve-drawers t)
(setq org-toodledo-folder-support-mode 'heading)
(setq org-toodledo-sync-new-completed-tasks t)
(setq org-toodledo-status-to-org-map
      '(("Active" . "TODO")
        ("None" . "TODO")
        ("Next Action" . "NEXT")
        ("Planning" . "TODO")
        ("Delegated" . "DELEGATED")
        ("Waiting" . "WAITING")
        ("Someday" . "SOMEDAY")
        ("Hold" . "SOMEDAY")
        ("Postponed" . "SOMEDAY")
        ("Canceled" . "CANCELED")
        ("Reference" . "REFERENCE")))

(setq
 op/personal-disqus-shortname "rfnash"
 op/personal-github-link "https://github.com/rfnash"
 op/repository-directory "~/git/blog.git/"
 op/repository-html-branch "gh-pages"
 op/repository-org-branch "source"
 op/site-domain "http://robertnash.net/"
 op/site-main-title "Robert Nash's Blog"
 op/site-sub-title "A sedomly updated blog")

(setq
 org-log-into-drawer t
 org-refile-use-cache t
 org-return-follows-link t
 org-sort-agenda-notime-is-late nil

 org-journal-dir "~/Documents/OrgMode/journal/")

(setq
 org-directory "~/Documents/OrgMode"
 org-default-notes-file (concat org-directory "/notes.org")
 ;; org-mobile-use-encryption t
 org-mobile-directory "~/Dropbox/MobileOrg"
 org-mobile-inbox-for-pull (concat org-directory "from-mobile.org")
 org-habit-graph-column 65
 org-capture-templates '(
                         ("a" "Article"
                          entry (id "1c5d07ad-8ba3-4db9-b3ae-3f4441cf51ca")
                          "* TODO %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("b" "Bookmarks to file"
                          entry ( file+datetree "~/Documents/OrgMode/agenda.org")
                          "* FILE %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("B" "Bookmarks to file (with link annotation)"
                          entry ( file+datetree "~/Documents/OrgMode/agenda.org")
                          "* FILE %?%a\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("c" "Scheduled Task"
                          entry ( id "79c8de14-8039-4d8c-b87e-f8c499860694")
                          "* SCHED %?\nSCHEDULED: %t")
                         ("d" "Design Examples"
                          entry (id  "2d9bf65f-6b2b-4e8a-81f5-b2faf22f8a6f")
                          "* %? :GoodDesign:\n:PROPERTIES:\n:CREATED:  %U\n:END:")
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
                         ("n" "Task - Next"
                          entry ( file+datetree "~/Documents/OrgMode/agenda.org")
                          "* NEXT %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("N" "Non-profit"
                          entry ( id "9e1cc358-cbc6-4b72-af68-c16017986720")
                          "* %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("o" "Toodledo Task"
                          entry ( id "bbd1b4a1-3f1a-4e97-ac45-7719edbaf700")
                          "* NEXT %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("p" "Person"
                          entry ( id "fbefa010-a0a4-4915-bc7e-ce1844a5e3a5")
                          "* %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("P" "Personal"
                          entry ( id "5baf8be5-b956-421a-950c-6e39c8e6d52e")
                          "* %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("s" "Scratch"
                          entry ( file+datetree "~/Documents/OrgMode/agenda.org")
                          "* %? :SCRATCH:\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("S" "Sent to Kindle"
                          entry ( id "baef29b1-40b5-4704-bf28-24b1898c41c9")
                          "* TODO %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("t" "Task"
                          entry ( file+datetree "~/Documents/OrgMode/agenda.org")
                          "* TODO %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("T" "Task (with link annotation)"
                          entry ( file+datetree "~/Documents/OrgMode/agenda.org")
                          "* TODO %?%a\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("u" "Quote"
                          entry (id "67e35685-d8e5-488d-8ab2-ac36a7ee3c9a")
                          "* %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
                         ("w" "To Watch"
                          entry ( id "e8e91a3d-d21b-403d-b46e-0be14a3d7c2d")
                          "* TODO %?\n:PROPERTIES:\n:CREATED:  %U\n:END:"))
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
                   (concat org-directory "/Toodledo.org")
                   (concat org-directory "/reference.org")
                   (concat org-directory "/entertainment.org")
                   (concat org-directory "/filing.org")
                   (concat org-directory "/agenda.org")
                   )
 org-agenda-custom-commands '(("n" "Agenda and all NEXT actions"
                               ((agenda "")
                                (tags-todo "NEXT|TODO=\"NEXT\"" nil)))
                              ("v" "Videos to watch"
                               tags "CATEGORY=\"ToWatch\"" nil)
                              ;; TODO: consider only including those not under the appropriate level 1 heading
                              ("f" "Bookmarks to file"
                               ((todo "FILE"))))
 org-agenda-dim-blocked-tasks 'invisible
 org-agenda-skip-scheduled-if-deadline-is-shown t
 org-agenda-skip-scheduled-if-done t
 org-agenda-span 'day
 org-refile-use-cache t
 org-return-follows-link t
 org-sort-agenda-notime-is-late nil
 org-agenda-time-grid '((daily today require-timed)
                        #("----------------" 0 16
                          (org-heading t))
                        (800 900 1000 1200 1400 1600 1800 2000 2200 2259 2300))
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
 org-velocity-bucket "~/Documents/OrgMode/reference.org"
 )
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

;;(require 'rfnash-org-mode-to-appt)

;; These don't seem to be working for me
;; I want something that will only close the frame if it was created by org-protocol
(defadvice org-capture-finalize
  (after delete-capture-frame activate)
  "Advise capture-finalize to close the frame."
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-frame)))

(defadvice org-capture-kill
  (after delete-capture-frame activate)
  "Advise capture-kill to close the frame."
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-frame)))

;; (defvar rfnash-hide-blocked-tasks nil "If non-nil, hide blocked tasks, else dim them.")
;; (defun org-agenda-hide-blocked-tasks ()
;;   "Toggle dimming/hiding blocked tasks."
;;   (interactive)
;;   (if rfnash-hide-blocked-tasks
;;       (progn
;;         (setq rfnash-hide-blocked-tasks nil)
;;         (org-agenda-dim-blocked-tasks)
;;         )
;;     (progn
;;       (setq rfnash-hide-blocked-tasks t)
;;       (org-agenda-dim-blocked-tasks t))))
;; (define-key org-agenda-mode-map (kbd "#") 'org-agenda-hide-blocked-tasks)

(provide 'rfnash-org-mode)
;;; rfnash-org-mode.el ends here
