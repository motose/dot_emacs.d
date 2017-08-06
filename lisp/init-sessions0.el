;; save a list of open files in ~/.emacs.d/.emacs.desktop
(require 'desktop)
(setq desktop-save t)
(setq desktop-load-locked-desktop t)
(setq *desktop-dir* (list (expand-file-name "~/.emacs.d/desktop")))
(setq desktop-base-file-name ".emacs.desktop")
(setq desktop-path *desktop-dir*)
(setq desktop-dir *desktop-dir*)
(setq desktop-path (list user-emacs-directory)
      desktop-auto-save-timeout 600)
(desktop-save-mode 1)
(desktop-read)
(setq desktop-enable t)
(defadvice desktop-read (around trace-desktop-errors activate)
  (let ((debug-on-error t))
    ad-do-it))

(defadvice desktop-read (around time-restore activate)
    (let ((start-time (current-time)))
      (prog1
          ad-do-it
        (message "Desktop restored in %.2fms"
                 (sanityinc/time-subtract-millis (current-time)
                                                 start-time)))))

(defadvice desktop-create-buffer (around time-create activate)
  (let ((start-time (current-time))
        (filename (ad-get-arg 1)))
    (prog1
        ad-do-it
      (message "Desktop: %.2fms to restore %s"
               (sanityinc/time-subtract-millis (current-time)
                                               start-time)
               (when filename
		 (abbreviate-file-name filename))))))
;
; Specifying Files Not to be Opened
;
(setq desktop-buffers-not-to-save
        (concat "\\("
                "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
                "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
	        "\\)$"))
   (add-to-list 'desktop-modes-not-to-save 'dired-mode)
   (add-to-list 'desktop-modes-not-to-save 'Info-mode)
   (add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
   (add-to-list 'desktop-modes-not-to-save 'fundamental-mode)
   (add-to-list 'desktop-modes-not-to-save 'Info-mode)
   (add-to-list 'desktop-modes-not-to-save 'python-mode)


;(autoload 'python-mode "python-mode" "Python Mode." t)
;(require 'package)
;(add-to-list 'package-archives
;             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

;(add-to-list 'desktop-buffer-mode-handlers
;                 '(python-mode . elpy_setup))

;;----------------------------------------------------------------------------
;; Restore histories and registers after saving
;;----------------------------------------------------------------------------
(setq-default history-length 1000)
(savehist-mode t)

(provide 'init-sessions0)
