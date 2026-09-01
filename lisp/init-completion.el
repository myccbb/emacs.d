(use-package vertico
  :custom
  (vertico-scroll-margin 0)
  (vertico-count 20)
  (vertico-resize nil)
  (vertico-cycle t)
  :init
  (vertico-mode)
  )

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package consult
  :bind (
         ("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x 5 b" . consult-buffer-other-frame)
         ("C-c s p" . consult-ripgrep)
         ("C-c s c" . my:search-in-current-dir)
         ("C-c s d" . my:choose-dir-and-search))
  :config
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  )

(use-package savehist
  :init
  (savehist-mode)
  )

(use-package marginalia
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  :init
  (marginalia-mode 1))

(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 2)
  (corfu-cycle t)
  (corfu-quit-at-boundary nil)
  (corfu-quit-no-match 'separator)
  (corfu-preview-current nil)
  (corfu-count 15)
  (corfu-min-width 50)
  (corfu-scroll-margin 3)
  (corfu-bar-width 0.4)

  :init
  (global-corfu-mode)
  (corfu-history-mode)

  :config
  (corfu-popupinfo-mode 1)
  (setq corfu-popupinfo-delay 0.2)

  :bind
  (:map corfu-map
        ("SPC" . corfu-insert-separator))
  )

(use-package corfu-terminal
  :unless (display-graphic-p)
  :config
  (corfu-terminal-mode +1))

(use-package nerd-icons-corfu
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))

(use-package eglot
  :ensure nil
  :hook
  ((python-ts-mode
    rust-ts-mode
    c-ts-mode
    c++-ts-mode
    go-ts-mode
    js-ts-mode
    typescript-ts-mode) . eglot-ensure)
  :config
  ;;(setq eglot-ignored-server-capabilities '(:hoverProvider))
  ;;(add-hook 'before-save-hook #'eglot-format-buffer) ; format on save
  (setq read-process-output-max (* 3 1024 1024)) ; improve performance
  (setq eglot-sync-connect 1) ; change delay to 1 second (default is 0.5)
  (setq eglot-connect-timeout 3600)
  (setq eglot-request-timeout 3600)
  (setq jsonrpc-default-request-timeout 3600)
  (setq eglot-autoreconnect t)
  )

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (global-treesit-auto-mode))

(provide 'init-completion)
