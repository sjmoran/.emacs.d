;;; init-tweaks.el --- Miscellaneous "tweaks" to my emacs environment

;;; Commentary:
;;
;; init-tweaks.el contains miscellaneous tweaks to the Emacs environment.
;; These are the sorts of changes that don't directly relate to packages,
;; etc, and aren't about how Emacs looks.

;;; Code:

(require 'is-a)

;; Ignore case when searching
(setq-default case-fold-search t)

;; Auto-saves and backing up. Here I try and keep my work directories as
;; clean as possible.
(let ((auto-saves (local-emacs-directory "auto-save-files/")))
  (unless (file-exists-p auto-saves)
    (make-directory auto-saves t))
  (setq auto-save-list-file-prefix     (local-emacs-directory "auto-save-list/saves-")
        auto-save-file-name-transforms `((".*" ,auto-saves t))
        backup-directory-alist         `((".*" . ,(local-emacs-directory "backups")))
        backup-by-copying              t
        version-control                t
        delete-old-versions            t
        kept-new-versions              10
        load-prefer-newer              t))

;; On the Mac, local bin doesn't seem to be in the path if I run from the
;; dock. Fix this (in both `exec-path` and PATH).
(when is-a-macOS-p
  (let ((local "/usr/local/bin"))
    (when (file-exists-p local)
      (unless (member local exec-path)
        (push local exec-path))
      (unless (string-match-p (regexp-quote local) (getenv "PATH"))
        (setenv "PATH" (concat (getenv "PATH") ":" local))))))

;; If we're on a Unix of some sort, add a personal bin (if it's there).
(let ((bin "~/bin"))
  (when (and is-a-unix-p (file-exists-p bin))
    (push bin exec-path)))

;; Enable some disabled commands
(mapc (lambda (command)
        (put command 'disabled nil))
      '(downcase-region
        erase-buffer
        narrow-to-page
        narrow-to-region
        upcase-region))

;; Some functions in elisp seem to be missing sensible indent declare forms.
;; Let's fix them.
(mapc (lambda (indent)
        (put (car indent) 'lisp-indent-function (cdr indent)))
      '((with-current-buffer-window . 3)
        (with-temp-buffer-window    . 3)))

(provide 'init-tweaks)

;;; init-tweaks.el ends here
