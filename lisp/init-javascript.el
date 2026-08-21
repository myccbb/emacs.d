(use-package json-mode
  :ensure t
  :mode "\\.json\\'"
  )

(use-package rjsx-mode
  :ensure t
  :mode "\\.js\\'"
  :config
  (setq js-indent-level 2)
  ;; make '_' a word character
  (add-hook 'rjsx-mode-hook
            (lambda () (modify-syntax-entry ?_ "w" js2-mode-syntax-table)))
  )
;(use-package json-mode)
;(use-package js2-mode)
;
;(require 'js2-mode)
;
;;; set js2-mode as major mode for javascript
;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;
;;; Set javascript indents to 2 spaces
;(setq js-indent-level 4)
;
;;; make '_' a word character
;(add-hook 'js2-mode-hook
;          (lambda () (modify-syntax-entry ?_ "w" js2-mode-syntax-table)))
;
;;; set js2-mode indent
;(setq js2-basic-offset 4)
;
;;; enable rainbow-delimiters
;(add-hook 'js2-mode-hook 'rainbow-delimiters-mode)
;
;;; disable js2 mode's syntax error highlighting
;(with-eval-after-load 'js2-mode
;  (setq-default js2-mode-show-parse-errors nil
;                js2-mode-show-strict-warnings nil)
;  )



(provide 'init-javascript)
