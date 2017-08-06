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
;	javascriptモード

;;; Code:

(when (eval-after-autoload-if-found
         '(js2-mode) "js2-mode" nil t nil
         '((require 'js2-refactor nil t)))
 
    (push '("\\.js$" . js2-mode) auto-mode-alist)
    (when (eval-after-autoload-if-found
           '(ac-js2-mode ac-js2-setup-auto-complete-mode) "ac-js2" nil t)
      (add-hook 'js2-mode-hook 'ac-js2-mode)))
 
    (if (executable-find "tern")
        (when (eval-after-autoload-if-found
               '(tern-mode) "tern" nil t nil
               '((tern-mode 1)
                 ;; tern-command shall be overwritten by actual path
                 (setq tern-command `("node" ,(executable-find "tern")))
                 (when (require 'tern-auto-complete nil t)
                   (tern-ac-setup))))
          (add-hook 'js2-mode-hook 'tern-mode))
 
      (message "--- tern is NOT installed in this system."))


;----------------------------------------
;(require-package 'json-mode)
;(maybe-require-package 'js2-mode)
;(maybe-require-package 'ac-js2)
;(maybe-require-package 'coffee-mode)
;(require-package 'js-comint)
;
;(defcustom preferred-javascript-mode
;  (first (remove-if-not #'fboundp '(js2-mode js-mode)))
;  "Javascript mode to use for .js files."
;  :type 'symbol
;  :group 'programming
;  :options '(js2-mode js-mode))
;(defvar preferred-javascript-indent-level 2)
;
;;; Need to first remove from list if present, since elpa adds entries too, which
;;; may be in an arbitrary order
;(eval-when-compile (require 'cl))
;(setq auto-mode-alist (cons `("\\.js\\(\\.erb\\)?\\'" . ,preferred-javascript-mode)
;                            (loop for entry in auto-mode-alist
;                                  unless (eq preferred-javascript-mode (cdr entry))
;                                  collect entry)))
;
;
;;; js2-mode
;(after-load 'js2-mode
;  ;; Disable js2 mode's syntax error highlighting by default...
;  (setq-default js2-mode-show-parse-errors nil
;                js2-mode-show-strict-warnings nil)
;  ;; ... but enable it if flycheck can't handle javascript
;  (autoload 'flycheck-get-checker-for-buffer "flycheck")
;  (defun sanityinc/disable-js2-checks-if-flycheck-active ()
;    (unless (flycheck-get-checker-for-buffer)
;      (set (make-local-variable 'js2-mode-show-parse-errors) t)
;      (set (make-local-variable 'js2-mode-show-strict-warnings) t)))
;  (add-hook 'js2-mode-hook 'sanityinc/disable-js2-checks-if-flycheck-active)
;
;  (add-hook 'js2-mode-hook (lambda () (setq mode-name "JS2")))
;
;  (setq-default
;   js2-basic-offset preferred-javascript-indent-level
;   js2-bounce-indent-p nil)
;
;  (after-load 'js2-mode
;    (js2-imenu-extras-setup)))
;
;;; js-mode
;(setq-default js-indent-level preferred-javascript-indent-level)
;
;
;(add-to-list 'interpreter-mode-alist (cons "node" preferred-javascript-mode))
;
;
;;; Javascript nests {} and () a lot, so I find this helpful
;
;(require-package 'rainbow-delimiters)
;(dolist (hook '(js2-mode-hook js-mode-hook json-mode-hook))
;  (add-hook hook 'rainbow-delimiters-mode))
;
;
;
;;;; Coffeescript
;
;(after-load 'coffee-mode
;  (setq coffee-js-mode preferred-javascript-mode
;        coffee-tab-width preferred-javascript-indent-level))
;
;(when (fboundp 'coffee-mode)
;  (add-to-list 'auto-mode-alist '("\\.coffee\\.erb\\'" . coffee-mode)))
;
;;; ---------------------------------------------------------------------------
;;; Run and interact with an inferior JS via js-comint.el
;;; ---------------------------------------------------------------------------
;
;(setq inferior-js-program-command "js")
;
;(defvar inferior-js-minor-mode-map (make-sparse-keymap))
;(define-key inferior-js-minor-mode-map "\C-x\C-e" 'js-send-last-sexp)
;(define-key inferior-js-minor-mode-map "\C-\M-x" 'js-send-last-sexp-and-go)
;(define-key inferior-js-minor-mode-map "\C-cb" 'js-send-buffer)
;(define-key inferior-js-minor-mode-map "\C-c\C-b" 'js-send-buffer-and-go)
;(define-key inferior-js-minor-mode-map "\C-cl" 'js-load-file-and-go)
;
;(define-minor-mode inferior-js-keys-mode
;  "Bindings for communicating with an inferior js interpreter."
;  nil " InfJS" inferior-js-minor-mode-map)
;
;(dolist (hook '(js2-mode-hook js-mode-hook))
;  (add-hook hook 'inferior-js-keys-mode))
;
;;; ---------------------------------------------------------------------------
;;; Alternatively, use skewer-mode
;;; ---------------------------------------------------------------------------
;
;(when (maybe-require-package 'skewer-mode)
;  (after-load 'skewer-mode
;    (add-hook 'skewer-mode-hook
;              (lambda () (inferior-js-keys-mode -1)))))
;
;
;----------------------------------------

(provide 'init-javascript)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; init-javascript.el ends here


