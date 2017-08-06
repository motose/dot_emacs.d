;; -*- mode: emacs-lisp; coding: utf-8; indent-tabs-mode: nil -*-
;;
;; Copyright(C) Yutaka Motose All rights reserved.
;; $Lastupdate: 2017-07-02 10:15:03$
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
;	Pythonモード

;;; Code:

(autoload 'python-mode "python-mode" "Python Mode." t)
 (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
 (add-to-list 'interpreter-mode-alist '("ipython" . python-mode))

(defun py-next-block ()
   "go to the next block.  Cf. `forward-sexp' for lisp-mode"
   (interactive)
   (py-mark-block nil 't)
   (back-to-indentation))
;--------------------------


(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

;;; python mode
(add-hook 'python-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (setq indent-level 4)
             (setq python-indent 4)
             (setq tab-width 4)
             (package-initialize)
             (elpy-enable)
             (elpy-mode)
             (setq elpy-rpc-python-command "/Users/motose/.pyenv/versions/3.6.1/bin/python")
             (defvar venv-default "~/.virtualenvs/default")
             ;;; デフォルト環境を有効化
             (pyvenv-activate venv-default)
             ;;; 自動補完のバックエンドとして Rope か Jedi を選択
             (setq elpy-rpc-backend "jedi")
             (setq python-shell-interpreter "ipython")
             (setq python-shell-interpreter-args "--simple-prompt --pprint")
          t))

;;; elpy mode
(add-hook 'elpy-mode-hook
          '(lambda ()
             (setq elpy-rpc-python-command "/Users/motose/.pyenv/versions/3.6.1/bin/python")
             ;(setq python-shell-interpreter-args "--simple-prompt --pprint")
             (setq python-shell-interpreter-args "--colors=NoColor -i") 
             (defvar venv-default "~/.virtualenvs/default")
             ;;; デフォルト環境を有効化
             (pyvenv-activate venv-default)
             ;;; 自動補完のバックエンドとして Rope か Jedi を選択
             (setq elpy-rpc-backend "jedi")
             ;; REPL 環境に IPython を使う
             (elpy-use-ipython)

             ;;; python flycheck
             (require 'flycheck nil t)
             (remove-hook 'elpy-modules 'elpy-module-flymake)
             (add-hook 'elpy-mode-hook 'flycheck-mode)

             (define-key elpy-mode-map (kbd "C-c C-v") 'helm-flycheck)
             (require 'smartrep)   
             (smartrep-define-key elpy-mode-map "C-c"
               '(("C-n" . flycheck-next-error)
                 ("C-p" . flycheck-previous-error)))

             ;;; py-yapf
             (add-hook 'elpy-mode-hook 'py-yapf-enable-on-save)

             (set-face-background 'highlight-indentation-face "#313131")
             (set-face-background 'highlight-indentation-current-column-face "#777777")
             (add-hook 'elpy-mode-hook 'highlight-indentation-current-column-mode)

             ;; quickrunをC-cC-cに設定
             (define-key elpy-mode-map "\C-c\C-c" 'quickrun)

             ;; company-mode + rope/jediを使うためautocompletionをオフ
             (auto-complete-mode -1)
             ; companyによる補完のキーマップを設定
             (define-key company-active-map (kbd "\C-n") 'company-select-next)
             (define-key
               company-active-map (kbd "\C-p") 'company-select-previous)
             (define-key
               company-active-map (kbd "\C-d") 'company-show-doc-buffer)
             (define-key
               company-active-map (kbd "<tab>") 'company-complete)
             ))

(provide 'init-python)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; init-python.el ends here
