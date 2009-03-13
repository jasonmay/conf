(setq load-path (cons "~/.emacs-el" load-path))
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
(setq vc-follow-symlinks t)
(global-font-lock-mode 1)
(set-foreground-color "gray")
(set-background-color "black")
;;(setq-default viper-mode t)
;;(require 'viper)
(setq load-path (cons (expand-file-name "~/.emacs.d/lisp") load-path))
(setq load-path (cons (expand-file-name "~/.emacs.d/sepia") load-path))
(setq load-path (cons (expand-file-name "~/.emacs.d/pde") load-path))
(setq sepia-perl5lib (list (expand-file-name "~/.emacs.d/sepia/lib")))
(defalias 'perl-mode 'sepia-mode)
(require 'sepia)

(require 'htmlize)
(require 'template)
(template-initialize)

(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))

(setq cperl-invalid-face nil)
(setq cperl-hairy t)
(setq cperl-indent-level 4
      cperl-close-paren-offset -4
      cperl-continued-statement-offset 4
      cperl-indent-parens-as-block t
      cperl-tab-always-indent t)
(setq cperl-electric-keywords t)
(add-hook 'cperl-mode-hook
    (lambda ()
        (local-set-key (kbd "C-h f") 'cperl-perldoc)))	
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(paren-match-face (quote paren-face-match-light))
 '(paren-sexp-mode t))
(custom-set-faces
 '(default ((t nil)))
 '(cperl-array-face ((t (:foreground "cyan" :weight bold))))
 '(cperl-hash-face ((t (:foreground "cyan" :weight bold))))
 '(cperl-nonoverridable-face ((((class color) (background dark)) (:foreground "yellow"))))
 '(custom-state ((((class color) (background dark)) (:foreground "green"))))
 '(font-lock-constant-face ((((class color) (min-colors 8)) (:foreground "magenta"))))
 '(font-lock-keyword-face ((((class color) (min-colors 8)) (:foreground "yellow"))))
 '(font-lock-string-face ((((class color) (min-colors 8)) (:foreground "red" :width normal))))
 '(font-lock-type-face ((((class color) (min-colors 8)) (:foreground "green"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 8)) (:foreground "cyan" :weight light)))))
