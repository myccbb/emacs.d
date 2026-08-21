;;; web-mode

(use-package web-mode
  ;:mode ("\\.html\\'" "\\.css\\'")
  :mode "\\.html\\'"
  :config
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (add-hook 'web-mode-hook (lambda () (setq web-mode-markup-indent-offset 2)))

  ;;set my:node-modules-dir in custom.el
  ;;e.g. (setq my:node-modules-dir (expand-file-name "~/pkg/node/lib/node_modules"))
  (setq lsp-clients-angular-language-server-command
        (let ((nmdir (if (boundp 'my:node-modules-dir)
                         my:node-modules-dir
                       "/usr/lib/node_modules")))
          (list "node"
                (concat nmdir "/@angular/language-server")
                "--ngProbeLocations"
                nmdir
                "--tsProbeLocations"
                nmdir
                "--stdio")
          )
        )
  (add-hook 'web-mode-hook #'lsp-deferred)
  )

(use-package css-mode
  :mode "\\.css\\'"
  :config
  (add-hook 'css-mode-hook #'lsp-deferred)
  )

(provide 'init-web)
