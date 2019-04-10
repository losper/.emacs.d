
;;; user add
(global-auto-revert-mode t)
(setq make-backup-files nil)

(setq enable-recursive-minibuffers t)

(use-package dracula-theme
	     :ensure t
	     :init
	     (load-theme 'dracula t))

(use-package smex :ensure)
(use-package ivy :ensure
  :init
  (setq ivy-use-virtual-buffers t))
(use-package counsel :ensure)
(use-package swiper :ensure)

(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-x b") 'counsel-switch-buffer)
(global-set-key (kbd "C-s") 'swiper)
(provide 'init-custom)
