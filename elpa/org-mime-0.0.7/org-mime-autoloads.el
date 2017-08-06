;;; org-mime-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "org-mime" "org-mime.el" (0 0 0 0))
;;; Generated autoloads from org-mime.el

(autoload 'org-mime-org-buffer-htmlize "org-mime" "\
Create buffer where text encoded in html&org formats as mime alternatives.

\(fn)" t nil)

(autoload 'org-mime-org-subtree-htmlize "org-mime" "\
Create an email buffer containing the current subtree of the
current org-mode file exported to html and encoded in both html
and in org formats as mime alternatives.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-mime" '("org-mime-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; org-mime-autoloads.el ends here
