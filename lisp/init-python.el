(use-package elpy
  :ensure
  :init
  (elpy-enable)
  (setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
  )
(use-package py-autopep8
  :ensure
  :init
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))
(use-package flycheck
  :ensure
  :init
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(provide 'init-python)
