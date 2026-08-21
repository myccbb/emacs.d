(use-package flx-ido)
(use-package ido-completing-read+)
(use-package idomenu)
(use-package smex)

(require 'smex)
(smex-initialize)

(require 'flx-ido)
(ido-mode t)
(ido-everywhere t)
(flx-ido-mode t)

(require 'ido-completing-read+)
(ido-ubiquitous-mode t)

(setq ido-enable-flex-matching t)

;; Disable ido faces to see flx highlights
(setq ido-use-faces nil)
(setq ido-use-virtual-buffers t)
(setq ido-auto-merge-delay-time 2)


(global-set-key (kbd "M-x") 'smex)


(provide 'init-ido)
