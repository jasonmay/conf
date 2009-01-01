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
(setq cperl-electric-keywords t)
(setq cperl-hairy t)
(setq cperl-indent-level 4
      cperl-close-paren-offset -4
      cperl-continued-statement-offset 4
      cperl-indent-parens-as-block t
      cperl-tab-always-indent t)
