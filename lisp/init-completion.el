(use-package vertico
  :custom
  (vertico-scroll-margin 0)
  (vertico-count 20)
  (vertico-resize t)
  (vertico-cycle t)
  :init
  (vertico-mode)
  )

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package consult
  :ensure t
  :bind (
         ("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x 5 b" . consult-buffer-other-frame)))

(use-package savehist
  :init
  (savehist-mode)
  )

(use-package marginalia
  :ensure t
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  :init
  (marginalia-mode 1))

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion))))
  (completion-category-defaults nil)
  (completion-pcm-leading-wildcard t)
  )

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 2)
  (corfu-cycle t)
  (corfu-quit-at-boundary nil)
  (corfu-quit-no-match 'separator)
  (corfu-preview-current nil)

  :init
  (global-corfu-mode)
  (corfu-history-mode)

  :bind
  (:map corfu-map
        ("SPC" . corfu-insert-separator))
  )

(use-package corfu-terminal
  :ensure t
  :unless (display-graphic-p)
  :config
  (corfu-terminal-mode +1))

(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package cape
  :ensure t
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))

(provide 'init-completion)
