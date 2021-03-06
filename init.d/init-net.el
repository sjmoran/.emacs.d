;;; init-net.el --- Configuration that affects Net-base comms.

;;; Commentary:
;;
;; init-net.el configures things like Email sending and the url package.
;; Note that any package-based config will always be done via `use-package'
;; in the relevant init-package-* file, as a preference. This file is only
;; used for those changes that don't directly relate to a package.

;;; Code:

(setq
 ;; Who I am.
 user-mail-address "davep@davep.org"
 ;; Bounce my emails off gmail.
 smtpmail-smtp-server  "smtp.gmail.com"
 smtpmail-smtp-service 587
 send-mail-function    #'smtpmail-send-it
 ;; Configure the URL package.
 url-configuration-directory (local-emacs-directory "url/")
 url-cache-directory         (local-emacs-directory "url/cache")
 url-cookie-file             (local-emacs-directory "url/cookies")
 ;; Browse inside Emacs by default.
 browse-url-browser-function #'eww-browse-url
 ;; Security.
 nsm-save-host-names t
 nsm-settings-file   (local-emacs-directory "network-security.data")
 oauth2-token-file   (local-emacs-directory "oauth2.plstore"))

(provide 'init-net)

;;; init-editing.el ends here
