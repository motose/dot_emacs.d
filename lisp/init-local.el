;; -*- mode: emacs-lisp; coding: utf-8; indent-tabs-mode: nil -*-
;;
;; Copyright(C) Yutaka Motose All rights reserved.
;; $Lastupdate: 2014-11-02 17:29:49$
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
; 行番号の設定（F5 キーで表示・非表示を切り替え）
;===============================================================================
(require 'linum)
(global-linum-mode 0)
(global-set-key [f5] 'linum-mode)
(setq linum-format
        (lambda (line) (propertize (format
                (let ((w (length (number-to-string
                        (count-lines (point-min) (point-max))
                )))) (concat "%" (number-to-string w) "d "))
        line) 'face 'linum)))
(setq linum-format "%5d ")
;===============================================================================

;===============================================================================
; yasnippet
;===============================================================================
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        "~/.emacs.d/some/collection/"           ;; foo-mode and bar-mode snippet collection
        "~/.emacs.d/yasnippet/yasmate/snippets" ;; the yasmate collection
        "~/.emacs.d/yasnippet/snippets"         ;; the default collection
        ))
(yas-global-mode 1) ;; or M-x yas-reload-all 
;===============================================================================

;===============================================================================
; キーの設定（ある程度 Mac 標準に準拠させる）
;===============================================================================
(setq mac-command-key-is-meta nil)
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)
(global-set-key [?\s-c] 'kill-ring-save)
(global-set-key [?\s-v] 'yank)
(global-set-key [?\s-x] 'kill-region)
(global-set-key [?\s-z] 'undo)
(global-set-key [?\s-s] 'save-buffer)
(global-set-key [?\s-q] 'save-buffers-kill-terminal)
(global-set-key [?\s-f] 'isearch-forward)
(global-set-key [?\s-g] 'isearch-repeat-forward)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-h" 'help)
;===============================================================================

;===============================================================================
(setq make-backup-files nil)      ;; バックアップファイルを作らないようにする
(setq auto-save-default nil)
(setq vc-make-backup-files nil)
(show-paren-mode nil)             ;; 括弧の対応関係をハイライト表示
;(tool-bar-mode 0)                 ;; ツールバーを表示しないようにする
(setq inhibit-startup-message t)  ;; スタートアップ画面を表示しないようにする
(set-default 'line-spacing 4)     ;; 行間隔を少し広げる
;(setq default-frame-alist         ;; ウィンドウ（フレーム）のサイズ設定する
;      '((width . 120) (height . 60)))
(set-frame-parameter nil 'alpha '(90 70)) ;; 背景を透過させる
(setq mac-mouse-wheel-smooth-scroll t)    ;; マウス・スクロールを滑らかにする
(set-cursor-color "DarkGray")     ;; カーソルの色を設定
;===============================================================================

;===============================================================================
; コトノコ
;===============================================================================
(require 'current-string-to)
(setq current-string-to-delimiter-regexp current-string-to-delimiter-regexp-jp)
(defun kotonoko ()
       "Open kotonoko"
       (interactive)
       (shell-command "open -g -a /Applications/kotonoko.app")
       (current-string-to-copy)
       (shell-command "sleep 0.3")
       (shell-command "open -a /Applications/kotonoko.app"))
(global-set-key [?\s-k] 'kotonoko)
;===============================================================================

;===============================================================================
; GNU APL
;===============================================================================
(add-to-list 'load-path "~/.emacs.d/apl")
(require 'gnu-apl-mode)
(set-face-attribute 'gnu-apl-default nil
                    :family "APL385 Unicode"
                    :height 120)

(defun em-gnu-apl-init ()
  (setq buffer-face-mode-face 'gnu-apl-default)
  (buffer-face-mode))
(add-hook 'gnu-apl-interactive-mode-hook 'em-gnu-apl-init)
(add-hook 'gnu-apl-mode-hook 'em-gnu-apl-init)
;-------------------------------------------------------------------------------
(defun run-apl ()
  "Run GNU APL"
  (interactive)
  ;(set-frame-size  (selected-frame) 117 60)
  (set-frame-size (selected-frame) 81 50)
  (set-frame-position (selected-frame) 370 0)
  (gnu-apl nil)
  )
;===============================================================================

;===============================================================================
; TypeScript mode 
;===============================================================================
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(require 'tss)
;; キーバインド
(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")
(setq tss-implement-definition-key "C-c i")

;; 必要に応じて適宜カスタマイズして下さい。以下のS式を評価することで項目についての情報が得られます。
;; (customize-group "tss")

;; 推奨設定を行う
(tss-config-default)
;===============================================================================

;===============================================================================
; imaxima
;===============================================================================
(setq exec-path
      (append (list
               ;"/Applications/Maxima.app/Contents/Resources/maxima/bin"
               ;"/Applications/Gnuplot.app/Contents/Resources/bin"
               ;"/usr/local/sage/local/bin"
               "/usr/local/bin/"
               "/Library/TeX/texbin") exec-path))
(add-to-list 'load-path "/Applications/Maxima.app/Contents/Resources/maxima/share/maxima/5.38.0/emacs")
(autoload 'imaxima "imaxima" "Image support for Maxima." t)
(autoload 'imath-mode "imath" "Interactive Math mode" t)
(setq imaxima-latex-preamble "\\usepackage{eulervm}")
(setq imaxima-scale-factor 1.2)

;===============================================================================

;===============================================================================
; sage-shell-mode
;===============================================================================
(require 'sage-shell-mode)
;; Run SageMath by M-x run-sage instead of M-x sage-shell:run-sage
(sage-shell:define-alias)

;; Turn on eldoc-mode in Sage terminal and in Sage source files
(add-hook 'sage-shell-mode-hook #'eldoc-mode)
(add-hook 'sage-shell:sage-mode-hook #'eldoc-mode)

;; If you have Sage 7.4 or later, uncomment the following line.
(setq sage-shell:use-prompt-toolkit t)

(setq sage-shell:sage-root "/usr/local/sage")
;===============================================================================

(provide 'init-local)
