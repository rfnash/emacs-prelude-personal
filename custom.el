(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-additional-directory-list (quote ("/home/shared/.local/share/info/")))
 '(color-theme-is-global nil)
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("a53714de04cd4fdb92ed711ae479f6a1d7d5f093880bfd161467c3f589725453" "11d069fbfb0510e2b32a5787e26b762898c7e480364cbc0779fe841662e4cf5d" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "6a0f78c5c03bd65901f855f8f3e6fdb122856f641e0eed943cbefe828cdb871e" "b1f88f7e05e9e09e9c354b0b4ed9e5e4d7c9851069bf5ce898309340bf1b6d33" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(debug-on-error t)
 '(fci-rule-color "#383838")
 '(fill-flowed-display-column nil t)
 '(helm-completing-read-handlers-alist
   (quote
    ((describe-function . helm-completing-read-symbols)
     (describe-variable . helm-completing-read-symbols)
     (debug-on-entry . helm-completing-read-symbols)
     (find-function . helm-completing-read-symbols)
     (find-tag . helm-completing-read-with-cands-in-buffer)
     (ffap-alternate-file)
     (tmm-menubar)
     (find-file . ido)
     (switch-to-buffer . ido))) nil nil "added (find-file . ido) as I prefer ido's find-file interface to helm's, but like helm better for everything else.")
 '(helm-m-occur-idle-delay 0.5 t nil "Increased from 0.1 to 0.5 (the value used by org-occur-goto) because of the long time it takes to search")
 '(magit-use-overlays nil)
 '(op/personal-disqus-shortname "rfnash")
 '(op/personal-github-link "https://github.com/rfnash")
 '(op/repository-directory "~/git/blog.git/")
 '(op/repository-html-branch "gh-pages")
 '(op/repository-org-branch "source")
 '(op/site-domain "http://robertnash.net/")
 '(op/site-main-title "Robert Nash's Blog")
 '(op/site-sub-title "A sedomly updated blog")
 '(org-agenda-dim-blocked-tasks (quote invisible))
 '(org-agenda-sorting-strategy
   (quote
    ((agenda time-up habit-down priority-down category-keep)
     (todo priority-down category-keep)
     (tags priority-down category-keep)
     (search category-keep))))
 '(org-agenda-time-grid
   (quote
    ((daily today require-timed)
     #("----------------" 0 16
       (org-heading t))
     (800 1000 1200 1400 1600 1800 2000 2200 2259 2300))))
 '(org-blank-before-new-entry (quote ((heading) (plain-list-item))))
 '(org-contacts-birthday-format "Birthday: %h (%Y)" t)
 '(org-drill-optimal-factor-matrix nil)
 '(org-expiry-inactive-timestamps t)
 '(org-extend-today-until 0 nil nil "I had this set at 5, but setting Emac's timezone off by a few hours works better in practice, because using this method, the completion day of habits is still recorded as when I actually did them, not yesterday at 23:59")
 '(org-habit-following-days 1)
 '(org-habit-graph-column 71)
 '(org-habit-preceding-days 7)
 '(org-habit-show-all-today nil)
 '(org-habit-show-done-always-green t)
 '(org-id-link-to-org-use-id (quote create-if-interactive-and-no-custom-id))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-ctags org-gnus org-habit org-id org-info org-inlinetask org-mouse org-protocol org-w3m org-annotate-file org-bookmark org-checklist org-choose org-collector org-drill org-elisp-symbol org-eshell org-eval-light org-eval org-expiry org-git-link org-learn org-man org-mtags org-panel org-registry org-secretary org-toc org-track org-wikinodes org-learn org-mouse org-protocol org-registry org-secretary org-toc org-track)))
 '(org-refile-use-cache t)
 '(org-return-follows-link t)
 '(org-sort-agenda-notime-is-late nil)
 '(org-toodledo-password "Qho]cp;t(,52y@o}S+Y?Pq+CMH@6:K9V]$Ht)5XL")
 '(org-toodledo-preserve-drawers t)
 '(org-toodledo-userid "td52fa891b12039")
 '(prelude-clean-whitespace-on-save nil)
 '(prelude-whitespace nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(yas-snippet-dirs
   (quote
    ("~/.emacs.d/prelude/personal/snippits" "/home/rfnash/.emacs.d/prelude/elpa/yasnippet-20140106.1009/snippets")) nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-clocking ((t (:inherit org-scheduled :background "#268bd2"))) t)
 '(org-agenda-current-time ((t (:inherit org-time-grid :background "light green"))) t)
 '(term ((t (:inherit default :background "#002b36" :foreground "#eee8d6"))))
 '(term-bold ((t (:inverse-video t :weight bold))))
 '(term-color-black ((t (:background "#002b36" :foreground "#073642"))))
 '(term-color-blue ((t (:background "#002b36" :foreground "#268bd2"))))
 '(term-color-cyan ((t (:background "#002b36" :foreground "#2aa198"))))
 '(term-color-green ((t (:background "#002b36" :foreground "#859900"))))
 '(term-color-magenta ((t (:background "#002b36" :foreground "#d33682"))))
 '(term-color-red ((t (:background "#002b36" :foreground "#dc322f"))))
 '(term-color-white ((t (:background "#002b36" :foreground "#eee8d5"))))
 '(term-color-yellow ((t (:background "#002b36" :foreground "#b58900")))))
