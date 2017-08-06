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
;	Infoモード

;;; Code:

(eval-after-autoload-if-found
 '(info org-info-ja) "info" nil t nil
 '((add-to-list 'Info-additional-directory-list
                (expand-file-name "~/devel/mygit/org-ja/work/"))
   (defun org-info-ja (&optional node)
     "(Japanese) Read documentation for Org-mode in the info system.
    With optional NODE, go directly to that node."
     (interactive)
     (info (format "(org-ja)%s" (or node ""))))))

(provide 'init-info)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; init-info.el ends here



