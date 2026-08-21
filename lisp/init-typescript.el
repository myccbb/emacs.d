(use-package typescript-mode
  :mode "\\.ts\\'"
  :config
  (add-hook 'typescript-mode-hook #'lsp-deferred)
  (setq typescript-indent-level 2)
  ;; make '_' a word character
  (add-hook 'typescript-mode-hook '(lambda () (modify-syntax-entry ?_ "w" typescript-mode-syntax-table)))
  (add-hook 'typescript-mode-hook '(lambda () (add-hook 'before-save-hook 'tide-format-before-save)))
  )

(provide 'init-typescript)
