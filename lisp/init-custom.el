(defvar mage-init-time 'nil)
(defun mage-display-benchmark()
  (message "Mage loaded %s packages in %.03fs"
           (length package-activated-list)
           (or mage-init-time
               (setq mage-init-time
                     (float-time (time-subtract (current-time) before-init-time))))))
(add-hook 'emacs-startup-hook #'mage-display-benchmark)

(tool-bar-mode -1)

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

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(provide 'init-custom)

