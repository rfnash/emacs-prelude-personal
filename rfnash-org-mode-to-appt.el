;;; rfnash-org-mode-to-appt --- Set up reminders for all upcoming appointments

;;; Commentary:

;;;From http://doc.norang.ca/org-mode.html#Reminders

;;; Code:

(defun bh/org-agenda-to-appt ()
  "Erase all reminders and rebuilt reminders for today from the agenda."
  (interactive)
  (setq appt-time-msg-list nil)
  (org-agenda-to-appt))

;; Rebuild the reminders everytime the agenda is displayed
(add-hook 'org-finalize-agenda-hook 'bh/org-agenda-to-appt 'append)

;; This is at the end of my .emacs - so appointments are set up when Emacs starts
(bh/org-agenda-to-appt)

;; Activate appointments so we get notifications
(appt-activate t)

;; If we leave Emacs running overnight - reset the appointments one minute after midnight
(run-at-time "24:01" nil 'bh/org-agenda-to-appt)

;;; End from http://doc.norang.ca/org-mode.html#Reminders

(provide 'rfnash-org-mode-to-appt)
;;; rfnash-org-mode-to-appt ends here
