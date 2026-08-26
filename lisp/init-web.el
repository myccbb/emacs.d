;;; web-mode

(use-package web-mode
  ;;:mode ("\\.html\\'" "\\.css\\'")
  :mode "\\.html\\'"
  :config
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (add-hook 'web-mode-hook (lambda () (setq web-mode-markup-indent-offset 2)))
  )

(provide 'init-web)
