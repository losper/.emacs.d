(use-package projectile
  :ensure
  :config
  :config
  (projectile-global-mode))
(use-package flycheck)

(use-package lsp-mode
  :ensure
  :commands lsp
  :init
  (setq lsp-auto-guess-root t)    ; 我習慣自動選project root
  (setq lsp-prefer-flymake nil)
  :config
  (require 'lsp-clients)          ; ocaml,css,python,bash,...
  )
(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode)
(use-package company :ensure)
(use-package company-lsp :ensure)
    
(with-eval-after-load 'projectile
  (setq projectile-project-root-files-top-down-recurring
        (append '("compile_commands.json"
                  ".ccls")
                projectile-project-root-files-top-down-recurring)))

(defun ccls//enable ()
  (condition-case nil
      (lsp)
    (user-error nil)))

(use-package ccls
  :ensure t
  ;; :commands lsp-ccls-enable
  :hook ((c-mode c++-mode objc-mode) . (lambda () (require 'ccls) (lsp)))
  :init
  (push 'company-lsp company-backends)
  (global-company-mode 1)
  (setq ccls-args '("--log-file=/tmp/ccls.log"))
  )
;; Also see lsp-project-whitelist lsp-project-blacklist ccls-root-matchers
(add-hook 'c-mode-common-hook 
  (lambda ()
    (add-hook (make-local-variable 'before-save-hook)
              'lsp-format-buffer)))
(provide 'init-cpp)
