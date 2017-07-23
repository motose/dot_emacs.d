;; -*- mode: emacs-lisp; coding: utf-8; indent-tabs-mode: nil -*-
;;
;; Copyright(C) Yutaka Motose All rights reserved.
;; $Lastupdate: 2017-06-30 21:16:30$
;;
;; Author: Yutaka Motose <yutaka@motose.org>
;; License: GPL-3+
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
;;; Comment:
;;          Emacs設定ファイル
;;; Code:
;; -----------------------------------------------------------------------------


;; パッケージ初期化（削除しない）
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; バージョンチェック
;(let ((minver "23.3"))
;  (when (version<= emacs-version "23.1")
;    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
;(when (version<= emacs-version "24")
;  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
(require 'init-preload-local nil t)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require-package 'wgrep)
(require-package 'project-local-variables)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'mwe-log-commands)

(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-themes)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-proxies)
(require 'init-dired)
(require 'init-isearch)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-recentf)
(require 'init-ido)
(require 'init-hippie-expand)
(require 'init-windows)
(require 'init-fonts)
(require 'init-sessions)
(require 'init-mmm)            ; Multiple major modes
(require 'init-editing-utils)

(require 'init-flycheck)
(require 'init-auto-complete)
(require 'init-compile)

(require 'init-vc)
(require 'init-darcs)
(require-package 'dsvn)         ; Subversion interface
(require 'init-git)
(require 'init-github)

(require 'init-crontab)
(require 'init-textile)
(require 'init-markdown)
(require 'init-nxml)
(require 'init-html)
(require 'init-css)
;(require 'init-org)
(require 'init-haml)    ; Major mode for editing Haml files

(require 'init-cc)
(require 'init-csharp)
(require 'init-r)
(require 'init-nxml)
(require 'init-yaml)
(require 'init-json)
(require 'init-javascript)
(require 'init-python)

(require 'init-php)
(require 'init-erlang)
(require 'init-python-mode)
(require 'init-haskell)
(require 'init-ruby-mode)
(require 'init-rails)
(require 'init-sql)
(require 'init-csv)

(require 'init-paredit)  ;minor mode for editing parentheses
(require 'init-lisp)
(require 'init-slime)
(require 'init-clojure)
(when (>= emacs-major-version 24)
  (require 'init-clojure-cider))
(require 'init-common-lisp)

(require 'init-cedet)

(when *spell-check-support-enabled*
  (require 'init-spelling))

(require 'init-misc)

(require 'init-dash)  ; API Documentation Browser and Code Snippet Manager
(require 'init-ledger)      ; C++Ledger accounting system

;; Extra packages which don't require any configuration
(require-package 'gnuplot)    ; drive gnuplot from within emacs
(require-package 'lua-mode)   ; Lua scripts major-mode 
(require-package 'htmlize)     ; Convert buffer text and decorations to HTML.

(when *is-a-mac*
  (require-package 'osx-location))
(require-package 'regex-tool)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(when (file-exists-p (expand-file-name "init-local.el" user-emacs-directory))
  (error "Please move init-local.el to ~/.emacs.d/lisp"))
(require 'init-local nil t)

;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)

(add-hook 'after-init-hook
          (lambda ()
            (message "init completed in %.2fms"
                     (sanityinc/time-subtract-millis after-init-time before-init-time))))


(provide 'init)

;; coding: utf-8
;; no-byte-compile: t
;; Local Variables:
;; version-control: t
;; make-backup-files: t
;; delete-old-versions: t
;; kept-new-versions: 5
;; kept-old-versions: 0
;; End:
