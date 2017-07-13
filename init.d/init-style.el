;;; init-style.el --- Style Emacs to my taste

;;; Commentary:
;;
;; init-style.el contains code that styles Emacs to my taste. It includes
;; things like the default window size/position, theme choices, etc.

;;; Code:

;; Default colour scheme.
(load-theme (if (display-graphic-p) 'adwaita 'deeper-blue) t)

;; Window position and size.
(when (display-graphic-p)
  (let ((short-name (car (split-string (downcase (system-name)) "\\.")))
        (gndn (lambda () nil))
        (styles
         '(
           ("bellerophon" .
            (lambda ()
              (set-frame-size (selected-frame) 90 50)
              (set-frame-position (selected-frame) 230 60)))
           ("ariel" .
            (lambda ()
              (set-frame-size (selected-frame) 90 50)
              (set-frame-position (selected-frame) 300 80))))))
    (funcall (or (cdr (assoc short-name styles)) gndn))))

;; Window titles.
(let ((format (list (user-login-name) "@" (downcase (system-name))
                    " - "
                    "[%b" '(:eval (if (buffer-file-name)
                                      (format " (%s)" (abbreviate-file-name (buffer-file-name)))
                                    "")) "]")))
  (setq frame-title-format format
        icon-title-format  format))

;; If we're not on a graphical display...
(unless (display-graphic-p)
  ;; ...get rid of the menu bar.
  (menu-bar-mode -1))

;; When we're on a graphical display...
(when (display-graphic-p)
  (global-linum-mode 1))

(provide 'init-style)

;;; init-style.el ends here
