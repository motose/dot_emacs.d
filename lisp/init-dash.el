(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

;(add-to-list 'dash-at-point-mode-alist '(perl-mode . "perl"))
;(add-hook 'rinari-minor-mode-hook
;          (lambda () (setq dash-at-point-docset "rails")))



;; Support for the http://kapeli.com/dash documentation browser

;(defun sanityinc/dash-installed-p ()
  ;"Return t if Dash is installed on this machine, or nil otherwise."
  ;(let ((lsregister "/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"))
    ;(and (file-executable-p lsregister)
         ;(not (string-equal
               ;""
               ;(shell-command-to-string
                ;(concat lsregister " -dump|grep com.kapeli.dash")))))))
;
;(when (and *is-a-mac* (not (package-installed-p 'dash-at-point)))
  ;(message "Checking whether Dash is installed")
  ;(when (sanityinc/dash-installed-p)
    ;(require-package 'dash-at-point)))
;
;(when (package-installed-p 'dash-at-point)
  ;(global-set-key (kbd "C-c D") 'dash-at-point))
;
(provide 'init-dash)
