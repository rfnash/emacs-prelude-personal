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

(prelude-require-packages '(color-theme-solarized color-theme-buffer-local))
(require 'color-theme)
(color-theme-solarized-light)
(require 'color-theme-buffer-local)
(provide 'personal)
;;; personal.el ends here
