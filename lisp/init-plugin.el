;;; init-plugin.el --- common plugins
;;; Commentary:
;;; Code:

;;; Theme
;;(use-package color-theme-sanityinc-tomorrow)
;;(require 'color-theme-sanityinc-tomorrow)
;;(load-theme 'sanityinc-tomorrow-night t)
(use-package color-theme-sanityinc-tomorrow
  :config
  (load-theme 'sanityinc-tomorrow-night t)
  )


;;; persp-mode
(use-package persp-mode
  :delight
  :init
  (persp-mode 1)
  :custom
  (persp-auto-save-opt 1))


;;; Anzu
(use-package anzu
  :delight
  :config
  (global-anzu-mode t)
  )


;;; Highlight Indentation
(use-package indent-bars
  :config
  (require 'indent-bars-ts)
  :hook
  ((prog-mode . indent-bars-mode)))

;;; Uniquify - Making buffer names unique
(setq uniquify-buffer-name-style 'post-forward)


;;; Markdown mode
(use-package markdown-mode
  :mode "\\.md\\'"
  :config
  (add-hook 'markdown-mode-hook
            (lambda () (modify-syntax-entry ?_ "w")))
  )

;;; adoc-mode
(use-package adoc-mode
  :mode "\\.adoc\\'"
  :config
  (add-hook 'adoc-mode-hook (lambda() (buffer-face-mode t)))
  )

;;; lua-mode
(use-package lua-mode
  :mode "\\.lua\\'"
  :config
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
  (add-hook 'lua-mode-hook
            (lambda () (modify-syntax-entry ?_ "w")))
  (setq lua-indent-level 4)
  )

;;; cmake-mode
(use-package cmake-mode)


(use-package smartparens
  :ensure t
  :hook (prog-mode . smartparens-mode)
  :config
  (require 'smartparens-config))


;;; avy-mode
(use-package avy)

;;; window-numbering
(use-package winum
  :init
  (winum-mode 1))

;;; lemon-mode
(use-package lemon-mode)

;;; yasnippet
(use-package yasnippet
  :delight yas-minor-mode
  :config
  (setq yas-snippet-dirs
        (list (expand-file-name "snippets" user-emacs-directory))))
(yas-global-mode 1)


;;; expand-region
(use-package expand-region
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))


;;; clang-format
(use-package clang-format
  :config
  (setq-default clang-format-style "{IndentWidth: 4}"))


;;; yaml-mode
(use-package yaml-mode
  :mode "\\.yml\\'"
  :config
  (add-hook 'yaml-mode-hook
            (lambda () (modify-syntax-entry ?_ "w"))))


;;; fic-mode
(use-package fic-mode)


;;; dockerfile-mode
(use-package dockerfile-mode
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))


(use-package exec-path-from-shell
  :config
  ;; exec-path-from-shell
  (if (not (string-equal system-type "windows-nt"))
      (progn
        (exec-path-from-shell-initialize)
        (exec-path-from-shell-copy-env "GOPATH")
        )
    ))


;;; nginx-mode
(use-package nginx-mode)


;;; plantuml-mode
;; (use-package plantuml-mode)
(require 'plantuml-mode)
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))


;;; projectile
(use-package projectile
  :delight
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  )


(use-package apheleia
  :delight
  :config
  (apheleia-global-mode +1)
  (setf (alist-get 'python-mode apheleia-mode-alist) '(ruff)))


(use-package rime
  :custom
  (default-input-method "rime")
  (rime-share-data-dir "/usr/share/rime-data")
  (rime-show-candidate 'minibuffer)
  :config
  ;; git clone https://github.com/iDvel/rime-ice --depth=1 ~/.emacs.d/rime
  (setq rime-default-scheme "rime_ice")
  )


(use-package delight)


(use-package magit)


(use-package diff-hl
  :delight
  :init
  (global-diff-hl-mode)
  :config
  (diff-hl-flydiff-mode 1)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (unless (display-graphic-p)
    (diff-hl-margin-mode 1)))


(use-package eldoc
  :ensure nil
  :delight)


(use-package hi-lock
  :ensure nil
  :delight)


(use-package which-key
  :ensure nil
  :delight
  :init
  (which-key-mode 1))


(provide 'init-plugin)
;;; init-plugin.el ends here
