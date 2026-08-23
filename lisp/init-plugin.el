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
  :init
  (persp-mode 1)
  :custom
  (persp-auto-save-opt 1))


;;; Anzu
(use-package anzu
  :config
  (global-anzu-mode t)
  )


;;; Highlight Indentation
(use-package highlight-indentation
  :init
  (add-hook 'prog-mode-hook 'highlight-indentation-mode)
  (add-hook 'yaml-mode-hook 'highlight-indentation-mode)
  (add-hook 'xml-mode-hook 'highlight-indentation-mode)
  (add-hook 'nxml-mode-hook 'highlight-indentation-mode)
  (add-hook 'python-mode-hook 'highlight-indentation-mode)
  )


;;; Uniquify - Making buffer names unique
(setq uniquify-buffer-name-style 'post-forward)


;;; Flycheck - Modern on the fly syntax checking
;; Quick start : http://www.flycheck.org/manual/latest/Quickstart.html
;; Install ShellCheck https://github.com/koalaman/shellcheck/releases
(use-package flycheck
  :config
  (global-flycheck-mode)
  )


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

;;; rainbow-delimiters
(use-package rainbow-delimiters
  :init
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
  )

;;; avy-mode
(use-package avy)

;;; window-numbering
(use-package window-numbering
  :config
  (window-numbering-mode t)
  )

;;; lemon-mode
(use-package lemon-mode)

;;; yasnippet
(use-package yasnippet
  :config
  (setq yas-snippet-dirs
        (list (expand-file-name "snippets/snippets" user-emacs-directory))))
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
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  )


(use-package apheleia
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



(provide 'init-plugin)
;;; init-plugin.el ends here
