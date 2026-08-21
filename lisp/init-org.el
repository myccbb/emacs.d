;; Install htmlize for syntax highlighting of org-mode export.
(use-package htmlize)

(use-package org
  :ensure nil
  :defer t
  :mode (("\\.org\\'" . org-mode)
         ("\\.org.txt\\'" . org-mode))
  :config
  (setq-default org-startup-truncated nil)
  (setq-default org-startup-folded nil)
  (add-hook 'org-mode-hook
            (lambda ()
              (progn
                (setq-local evil-auto-indent nil)
                (define-key evil-normal-state-map (kbd "TAB") 'org-cycle)
                )))
  )

;(add-to-list 'auto-mode-alist '("\\.org.txt\\'" . org-mode))

(provide 'init-org)
