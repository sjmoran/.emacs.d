;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; personal keyboard bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key global-map [(control x)
                        (control b)]     #'ibuffer)
(define-key global-map [(meta f6)]       #'ibuffer)
(define-key global-map [(control f6)]    #'list-processes)
(define-key global-map [f6]              #'bury-buffer)
(define-key global-map [f9]              #'compile)
(define-key global-map [(meta g)]        #'goto-line)
(define-key global-map [(meta s)]        #'itch-scratch-buffer)
(define-key global-map [(alt l)]         #'ispell-word)
(define-key global-map [(meta left)]     #'backward-sexp)
(define-key global-map [(meta right)]    #'forward-sexp)
(define-key global-map [(meta p)]        #'(lambda ()
                                             (interactive)
                                             (other-window -1)))
(define-key global-map [(meta n)]        #'other-window)
(define-key global-map [(control c) (c)] #'cut-here)
(define-key global-map [(control c)
                        (control i)]     #'cut-file-here)
(define-key global-map [(control
                         return)]        #'split-line-keeping-fill-prefix)
(define-key global-map (kbd "C-c RET")   #'split-line-keeping-fill-prefix)
(define-key global-map [(control c) (e)] #'eshell)
(define-key global-map [(control c) (f)] #'insert-filename)
(define-key global-map [(control c) (k)] #'browse-kill-ring)
(define-key global-map [(control c) (o)] #'(lambda ()
                                             (interactive)
                                             (require 'org)
                                             (find-file (concat org-directory "/inbox.org"))))
(define-key global-map [(control c)
                        (control o)]     #'(lambda ()
                                             (interactive)
                                             (require 'org)
                                             (find-file org-directory)))
(define-key global-map [(control c) (r)] #'comment-region)
(define-key global-map [(control c)
                        (control t)]     #'thinks-maybe-region)
(define-key global-map [(f11)]           #'uptimes-current)
(define-key global-map [(control f11)]   #'clean-buffer-list)
(define-key global-map [home]            #'moving-home)
(define-key global-map [end]             #'moving-end)
(define-key global-map [delete]          #'delete-char)
(define-key global-map [(control
                         backspace)]     #'backward-kill-word)
(define-key global-map [(meta
                         backspace)]     #'undo)
(define-key global-map [(control z)]     #'undo)
(define-key global-map [(control c)
                        (control f)]     #'view-file)
(define-key global-map [(control c) (t)] #'uptimes)
(define-key global-map [(control c) (i)] #'boxquote-insert-file)
(define-key global-map [(control c)
                        (meta w)]        #'boxquote-kill-ring-save)
(define-key global-map [(control c) (y)] #'boxquote-yank)
(define-key global-map [(control c) (b)] #'boxquote-region)
(define-key global-map [(control c)
                        (control b)]     #'boxquote-title)
(define-key global-map [(control c)
                        (control h) (f)] #'boxquote-describe-function)
(define-key global-map [(control c)
                        (control h) (v)] #'boxquote-describe-variable)
(define-key global-map [(control c)
                        (control h) (k)] #'boxquote-describe-key)
(define-key global-map [(control c) (!)] #'boxquote-shell-command)
(define-key global-map [(control c)
                        (control h) (w)] #'boxquote-where-is)
(define-key global-map [(control c) (a)] #'org-agenda)
(when davep:osx-window-p
  (define-key global-map [(super tab)] #'completion-at-point))
(when davep:win32p
  (setq w32-lwindow-modifier 'meta))

(provide 'davep-keys)
