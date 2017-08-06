;; -*- mode: emacs-lisp; coding: utf-8; indent-tabs-mode: nil -*-
;;
;; Copyright(C) Yutaka Motose All rights reserved.
;; $Lastupdate: 2017-06-29 18:20:25$
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
;;; Comment:
;;
;;; Code:
;; -----------------------------------------------------------

;===============================================================================
(setq user-full-name (concat (getenv "DEBFULLNAME")))
(setq user-mail-address (concat (getenv "DEBEMAIL")))
;===============================================================================

;===============================================================================
; 日本語の設定（UTF-8）
;===============================================================================
(set-language-environment 'Japanese)
(set-default-coding-systems 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-locale-environment "ja_JP.UTF-8") ; "ja_JP.UTF-8"
(setenv "LC_CTYPE" "ja_JP.UTF-8")

;===============================================================================
; ファイル保存時に時間を記録する
;===============================================================================
(add-hook 'before-save-hook 'time-stamp)
(with-eval-after-load "time-stamp"
  (setq time-stamp-start "Lastupdate: ")
  (setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S$")
  (setq time-stamp-end "$")
  (setq time-stamp-line-limit 10)) ; def=8  

;===============================================================================
; GCサイズの最適
;===============================================================================
(setq gc-cons-threshold 134217728)

;===============================================================================
; cl を使う
;===============================================================================
(eval-when-compile
  (require 'cl-lib)
  (require 'org)
  (require 'org-clock)
  (require 'org-mac-link))

;===============================================================================
; リストで関数を渡せる autoload-if-found を使う
;===============================================================================
(defun autoload-if-found (functions file &optional docstring interactive type)
  "set autoload iff. FILE has found."
  (if (not (listp functions))
      (setq functions (list functions)))
  (and (locate-library file)
       (progn
         (dolist (function functions)
           (autoload function file docstring interactive type))
         t )))

;===============================================================================
; [eval-after-autoload-if-found.el] 遅延読み込み
;===============================================================================
(when (autoload-if-found
       '(cycle-buffer cycle-buffer-backward) "cycle-buffer" nil t)
  (with-eval-after-load "cycle-buffer"
    (setq cycle-buffer-allow-visible t)
    (setq cycle-buffer-show-length 12)
    (setq cycle-buffer-show-format '(" [ %s ]" . " %s"))))

;===============================================================================
; 遅延読み込み 
;===============================================================================
(defun eval-after-autoload-if-found
    (functions file &optional docstring interactive type after-body)
  "Set up autoload and eval-after-load for FUNCTIONS iff. FILE has found."
  (let ((enabled t)
        (package nil))
    (when (boundp 'loading-packages)
      (dolist (package loading-packages)
        (when (and (stringp (car package)) (equal file (car package)))
          (unless (cdr package)
            (setq enabled nil)
            (message "--- A setting for `%s' was NOT loaded explicitly"
                     (car package))))))
    (when enabled ;; if disabled then return nil.
      (when (locate-library file)
        (mapc (lambda (func)
                (autoload func file docstring interactive type))
              (if (listp functions)
                  functions
                (list functions)))
        (when after-body
          (eval-after-load file `(progn ,@after-body)))
        t))))






;; フレームの縦横サイズ・位置
(cond
 ((equal system-name "YM-MacBook-Air.local")
  (add-to-list 'default-frame-alist '(top . 0))
  (add-to-list 'default-frame-alist '(left . 0))
  (add-to-list 'default-frame-alist '(width . 192))
  (add-to-list 'default-frame-alist '(height . 50)))
 (t
  (add-to-list 'default-frame-alist '(top . 0))
  (add-to-list 'default-frame-alist '(left . 0))
  (add-to-list 'default-frame-alist '(width . 192))
  (add-to-list 'default-frame-alist '(height . 50)))
)

(provide 'init-preload-local)

