(use-package typescript-mode
  :mode "\\.ts\\'"
  :config
  (setq typescript-indent-level 2)
  ;; make '_' a word character
  (add-hook 'typescript-mode-hook '(lambda () (modify-syntax-entry ?_ "w")))
  )

(provide 'init-typescript)
