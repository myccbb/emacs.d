;;; init-lisp --- lsp settings
;;; Commentary:
;;; Code:
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :config
  (setq-default lsp-prefer-flymake nil)
  ;(add-to-list 'lsp-disabled-clients '(web-mode . angular-ls))
  )

(use-package company-lsp
  :commands company-lsp
  )

(provide 'init-lsp)
;;; init-lsp.el ends here
