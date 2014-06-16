;;; rfnash-erc --- My personal ERC config

;;; Commentary:
;; From emacswiki.org/emacs/ERC

;;; Code:

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
;;        (lambda (server nick)
;;          (add-hook 'erc-server-NOTICE-hook 'erc-auto-query)))

;; ;; Doesn't seem to work
;; (setq erc-autojoin-channels-alist
;;       '(("***REMOVED***.com" "#lesbian" "#sub/Dom" "#sluts_craving_humiliation")))
;;      ;;("oftc.net" "#bitlbee")))

(add-to-list 'load-path "~/.emacs.d/prelude/personal")
(require 'rfnash-el-get)
(require 'znc)
(require 'erc)
(require 'erc-nicklist)
(setq znc-servers '(("localhost" 1666 t ((efnet "rfnash/efnet" "***REMOVED***")
                                         (freenode "rfnash/freenode" "***REMOVED***")
                                         (bitlbee "rfnash/bitlbee" "***REMOVED***")))))
(setq erc-nicklist-voiced-position 'top)

(autoload 'erc-nick-notify-mode "erc-nick-notify"
  "Minor mode that calls `erc-nick-notify-cmd' when his nick gets
mentioned in an erc channel" t)
;; (eval-after-load 'erc '(erc-nick-notify-mode t))

(provide 'rfnash-erc)
;;; rfnash-erc.el ends here
