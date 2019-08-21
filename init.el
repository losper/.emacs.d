(require 'package)
(package-initialize)
(when (>= emacs-major-version 24)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(		
		use-package		
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-custom)
(require 'init-python)
(require 'init-cpp)
(require 'init-org)
;;(require 'init-evil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (auctex cdlatex use-package)))
 '(safe-local-variable-values
   (quote
    ((projectile-project-run-cmd . "zsh && cd binary && ./hpptest")
     (projectile-project-compilation-cmd . "cd build && pwd && sh gcc-linux.sh")
     (projectile-project-run-cmd . "cd binary && ./hpptest")
     (projectile-project-compilation-cmd . "zsh && cd build && pwd && sh gcc-linux.sh"))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
