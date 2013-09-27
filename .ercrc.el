;; ;; From emacswiki.org/emacs/ERC

;; (setq erc-echo-notices-in-minibuffer-flag t)

;; (require 'erc-match)
;; (setq erc-keywords '("Niki" "Nikki"))

;; ;; Doesn't seem to work
;; (require 'notifications)
;; (defun erc-global-notify (match-type nick message)
;;   "Notify when a message is recieved."
;;   (notifications-notify
;;    :title nick
;;    :body message
;;    :urgency 'low))
;; (add-hook 'erc-text-matched-hook 'erc-global-notify)


;; ;; Creates new buffer each time someone pm's me
;; ;; opens second window and shows buffer in non-focused window
;; ;; This happens even on different screen in elscreen
;; (setq erc-auto-query 'buffer)
;; (add-hook 'erc-after-connect
;; 	  (lambda (server nick)
;; 	    (add-hook 'erc-server-NOTICE-hook 'erc-auto-query)))

;; ;; Doesn't seem to work
;; (setq erc-autojoin-channels-alist
;;       '(("***REMOVED***.com" "#lesbian" "#sub/Dom" "#sluts_craving_humiliation")))
;; 	;;("oftc.net" "#bitlbee")))

(add-to-list 'load-path "~/.emacs.d/personal")
(require 'rfnash-el-get)
(require 'znc)
(require 'erc)
(require 'erc-nicklist)
