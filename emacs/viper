(setq-default viper-mode t
viper-expert-level '5

viper-ex-style-editing nil
viper-ex-style-motion nil
viper-auto-indent t
viper-inhibit-startup-message t
viper-eletric-mode t
viper-always t
viper-want-ctl-h-help t
viper-want-emacs-keys-in-insert t
viper-want-emacs-keys-in-vi t
viper-vi-style-in-minibuffer nil
viper-no-multiple-ESC t
viper-case-fold-search t
viper-re-search t
viper-re-query-replace t
viper-syntax-preference 'emacs
viper-delete-backwards-in-replace t
viper-parse-sexp-ignore-comments nil
viper-ESC-moves-cursor-back nil)

(define-key viper-vi-global-user-map "\C-f" 'forward-char)
(define-key viper-vi-global-user-map "\C-b" 'backward-char)
(define-key viper-vi-global-user-map "\M-v" 'scroll-down)
(define-key viper-vi-global-user-map "\C-v" 'scroll-up)
(define-key viper-vi-global-user-map "\C-y" 'yank)
(define-key viper-vi-global-user-map "\C-e"
(or (command-remapping 'move-end-of-line) 'move-end-of-line))

;; I don't like the default face in viper minibuffer
(setq viper-minibuffer-vi-face nil
viper-minibuffer-emacs-face nil)