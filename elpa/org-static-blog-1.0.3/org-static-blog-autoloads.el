;;; org-static-blog-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "org-static-blog" "org-static-blog.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from org-static-blog.el

(autoload 'org-static-blog-publish "org-static-blog" "\
Render all blog entries, the index, archive, and RSS feed.
Only blog entries that changed since the HTML was created are
re-rendered.

\(fn)" t nil)

(autoload 'org-static-blog-publish-file "org-static-blog" "\
Publish a single entry POST-FILENAME.
The index page, archive page, and RSS feed are not updated.

\(fn POST-FILENAME)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-static-blog" '("org-static-blog-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; org-static-blog-autoloads.el ends here
