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
    ("6a0f78c5c03bd65901f855f8f3e6fdb122856f641e0eed943cbefe828cdb871e" "b1f88f7e05e9e09e9c354b0b4ed9e5e4d7c9851069bf5ce898309340bf1b6d33" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(fci-rule-color "#383838")
 '(fill-flowed-display-column nil)
 '(gnus-group-default-list-level 3)
 '(gnus-save-duplicate-list t)
 '(gnus-summary-line-format "%U%R%z[%i]%I%(%[%4L: %-23,23f%]%) %s
")
 '(gnus-suppress-duplicates t)
 '(helm-m-occur-idle-delay 0.5 nil nil "Increased from 0.1 to 0.5 (the value used by org-occur-goto) because of the long time it takes to search")
 '(ido-ignore-buffers
   (quote
    ("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf")) nil nil "set to same as helm-c-boring-buffer-regexp")
 '(org-agenda-dim-blocked-tasks (quote invisible))
 '(org-blank-before-new-entry (quote ((heading) (plain-list-item))))
 '(org-drill-optimal-factor-matrix nil)
 '(org-expiry-inactive-timestamps t)
 '(org-extend-today-until 5)
 '(org-habit-following-days 1)
 '(org-habit-graph-column 65)
 '(org-habit-preceding-days 14)
 '(org-habit-show-all-today t)
 '(org-id-link-to-org-use-id (quote create-if-interactive-and-no-custom-id))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-ctags org-gnus org-habit org-id org-info org-inlinetask org-mouse org-protocol org-w3m org-annotate-file org-bookmark org-checklist org-choose org-collector org-drill org-elisp-symbol org-eshell org-eval-light org-eval org-expiry org-favtable org-git-link org-learn org-man org-mtags org-panel org-registry org-secretary org-toc org-track org-wikinodes org-json org-learn org-mouse org-protocol org-registry org-secretary org-toc org-track)))
 '(org-refile-use-cache t)
 '(org-return-follows-link t)
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
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-clocking ((t (:inherit org-scheduled :background "#268bd2"))) t)
 '(org-clock-overlay ((t (:background "yellow1" :foreground "black"))))
 '(org-level-8 ((t (:inherit outline-6))) nil "Changed because it is the same color as org-mode links. Chose color to be different from next highest and next lowest level.")
 '(term ((t (:inherit default :background "#002b36" :foreground "#eee8d6"))))
 '(term-bold ((t (:inverse-video t :weight bold))))
 '(term-color-black ((t (:background "#002b36" :foreground "#073642"))))
 '(term-color-blue ((t (:background "#002b36" :foreground "#268bd2"))))
 '(term-color-cyan ((t (:background "#002b36" :foreground "#2aa198"))))
 '(term-color-green ((t (:background "#002b36" :foreground "#859900"))))
 '(term-color-magenta ((t (:background "black" :foreground "#d33682"))))
 '(term-color-red ((t (:background "#002b36" :foreground "#dc322f"))))
 '(term-color-white ((t (:background "#002b36" :foreground "#eee8d5"))))
 '(term-color-yellow ((t (:background "#002b36" :foreground "#b58900")))))
