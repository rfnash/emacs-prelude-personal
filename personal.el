;;; Personal -- My personal customization to prelude

;; Copyright (C) 2013  Robert F. Nash

;; Author: Robert F. Nash <robert@robertnash.net>
;; Maintainer: Robert F. Nash <robert@robertnash.net>
;; Created: 11 Sept 2013
;; Version: 20130913-1

;;; Commentary:

;;; Code:

;;(setq prelude-whitespace nil)
;;(prelude-require-package 'org)
(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name
                      "personal.org" (expand-file-name
                                      "rfnash" prelude-personal-dir)))

(provide 'personal)
;;; personal.el ends here
