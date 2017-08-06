;; -*- mode: emacs-lisp; coding: utf-8; indent-tabs-mode: nil -*-
;;
;; Copyright(C) Yutaka Motose All rights reserved.
;; $Lastupdate: 2017-06-29 17:34:26$
;;
;; Author: Yutaka Motose <motose.yutaka@gmail.com>
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
;; -----------------------------------------------------------------------------

;;; Comment:
;	Haskellモード

;;; Code:

(autoload 'haskell-mode "haskell-mode" nil t)
(autoload 'haskell-cabal "haskell-cabal" nil t)

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

;; indent の有効.
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
;; フックを設定
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)
(add-hook 'haskell-mode-hook 'haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'view-mode)

(setq haskell-process-type 'stack-ghci)
(setq haskell-process-path-ghci "stack")
(setq haskell-process-args-ghci "ghci")

;; 環境変数PATHを設定しない場合は必要な設定
;;(add-to-list 'exec-path "~/stack-1.1.2-osx-x86_64")

;; Haskell Script の編集モード
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))

;; Ghci との連携
(setq haskell-program-name "/usr/local/bin/ghci")
(add-hook 'haskell-mode-hook 'inf-haskell-mode) ;; enable
(defadvice inferior-haskell-load-file (after change-focus-after-load)
  "Change focus to GHCi window after C-c C-l command"
  (other-window 1))
(ad-activate 'inferior-haskell-load-file)

;; gcd-mod

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; Flycheck specifics

(when (and (maybe-require-package 'flycheck-haskell)
           (require-package 'flycheck-hdevtools))
  (after-load 'flycheck
    (add-hook 'haskell-mode-hook #'flycheck-haskell-setup)

    (defun sanityinc/flycheck-haskell-reconfigure ()
      "Reconfigure flycheck haskell settings, e.g. after changing cabal file."
      (interactive)
      (unless (eq major-mode 'haskell-mode)
        (error "Expected to be in haskell-mode"))
      (flycheck-haskell-clear-config-cache)
      (flycheck-haskell-configure)
      (flycheck-mode -1)
      (flycheck-mode))

    (defadvice haskell-mode-stylish-buffer (around skip-if-flycheck-errors activate)
      "Don't run stylish-buffer if the buffer appears to have a syntax error.
This isn't a hard guarantee, since flycheck might sometimes not run until the file has
been saved."
      (unless (flycheck-has-current-errors-p 'error)
        ad-do-it))

    (require 'flycheck-hdevtools)))


; hlint
; 自動補完
(global-company-mode 1) ;; company-mode を常に ON
(add-to-list 'company-backends 'company-ghc)

(require 'ac-haskell-process) ; if not installed via package.el
(add-hook 'interactive-haskell-mode-hook 'ac-haskell-process-setup)
(add-hook 'haskell-interactive-mode-hook 'ac-haskell-process-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'haskell-interactive-mode))



;(require-package 'haskell-mode)
;
;
;;; Completion
;
;(add-to-list 'completion-ignored-extensions ".hi")
;
;;; Hook auto-complete into the completions provided by the inferior
;;; haskell process, if any.
;
;(require-package 'ac-haskell-process)
;
;(add-hook 'interactive-haskell-mode-hook 'ac-haskell-process-setup)
;(add-hook 'haskell-interactive-mode-hook 'ac-haskell-process-setup)
;
;(after-load 'haskell-mode
;  (define-key haskell-mode-map (kbd "C-c C-d") 'ac-haskell-process-popup-doc))
;
;(after-load 'auto-complete
;  (add-to-list 'ac-modes 'haskell-interactive-mode)
;  (add-hook 'haskell-interactive-mode-hook 'set-auto-complete-as-completion-at-point-function))
;
;
;
;;; Flycheck specifics
;
;(when (and (maybe-require-package 'flycheck-haskell)
;           (require-package 'flycheck-hdevtools))
;  (after-load 'flycheck
;    (add-hook 'haskell-mode-hook #'flycheck-haskell-setup)
;
;    (defun sanityinc/flycheck-haskell-reconfigure ()
;      "Reconfigure flycheck haskell settings, e.g. after changing cabal file."
;      (interactive)
;      (unless (eq major-mode 'haskell-mode)
;        (error "Expected to be in haskell-mode"))
;      (flycheck-haskell-clear-config-cache)
;      (flycheck-haskell-configure)
;      (flycheck-mode -1)
;      (flycheck-mode))
;
;    (defadvice haskell-mode-stylish-buffer (around skip-if-flycheck-errors activate)
;      "Don't run stylish-buffer if the buffer appears to have a syntax error.
;This isn't a hard guarantee, since flycheck might sometimes not run until the file has
;been saved."
;      (unless (flycheck-has-current-errors-p 'error)
;        ad-do-it))
;
;    (require 'flycheck-hdevtools)))
;
;
;;; Docs
;
;(dolist (hook '(haskell-mode-hook inferior-haskell-mode-hook haskell-interactive-mode-hook))
;  (add-hook hook 'turn-on-haskell-doc-mode)
;  (add-hook hook (lambda () (subword-mode +1))))
;(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;
;(add-hook 'haskell-interactive-mode-hook 'sanityinc/no-trailing-whitespace)
;
;
;;; Interaction
;
;(after-load 'haskell-process
;  (diminish 'interactive-haskell-mode " IntHS"))
;
;(add-auto-mode 'haskell-mode "\\.ghci\\'")
;
;(when (maybe-require-package 'ghci-completion)
;  (add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion))
;
;
;
;;; Indentation
;(require-package 'hi2)
;(add-hook 'haskell-mode-hook 'turn-on-hi2)
;
;
;
;;; Source code helpers
;
;(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
;
;(setq-default haskell-stylish-on-save t)
;
;(maybe-require-package 'hayoo)
;(after-load 'haskell-mode
;  (define-key haskell-mode-map (kbd "C-c h") 'hoogle)
;  (define-key haskell-mode-map (kbd "C-o") 'open-line))
;
;
;(after-load 'page-break-lines
;  (push 'haskell-mode page-break-lines-modes))
;
;;; Make compilation-mode understand "at blah.hs:11:34-50" lines output by GHC
;(after-load 'compile
;  (let ((alias 'ghc-at-regexp))
;    (add-to-list
;     'compilation-error-regexp-alist-alist
;     (list alias " at \\(.*\\.\\(?:l?[gh]hs\\|hi\\)\\):\\([0-9]+\\):\\([0-9]+\\)-[0-9]+$" 1 2 3 0 1))
;    (add-to-list
;     'compilation-error-regexp-alist alias)))
;
;
;



(provide 'init-haskell)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; init-haskell.el ends here
