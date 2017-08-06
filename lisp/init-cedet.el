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
;	CEDET IDE

; EDE      プロジェクト管理
; Semantic ソースコード解析やスマート補完、スマートジャンプ、シンボルリファレンス機能
; SRecode  テンプレート機能
; Cogre    UMLダイアグラム作成
; Speedbar ファイル/シンボルブラウザ
; EIEIO    コールツリーなどの表示

;;; Code:

;; Add further minor-modes to be enabled by semantic-mode.
;; See doc-string of `semantic-default-submodes' for other things
;; you can use here.
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
;(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)
          
;; Enable Semantic
(semantic-mode 1)
          
;; Enable EDE (Project Management) features
(global-ede-mode 1)

;;; **********
(provide 'init-cedet)

;; Local Variables:
;; coding: utf-8
;; indent-tabs-mode: nil
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:

;;; init-cedet.el ends here
