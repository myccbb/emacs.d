;;; init-python ---  python config
;;; Commentary:
;;; Code:


(use-package python
  :config
  (add-hook 'python-mode-hook
            (lambda () (modify-syntax-entry ?_ "w")))
  )


(provide 'init-python)
;;; init-python.el ends here
