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
;	C/C++モード

;;; Code:

(push '("\\.h$" . c++-mode) auto-mode-alist)
(when (eval-after-autoload-if-found
       'modern-c++-font-lock-mode "modern-cpp-font-lock" nil t)
  (add-hook 'c++-mode-hook #'modern-c++-font-lock-mode))

(provide 'init-cc)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; init-cc.el ends here



