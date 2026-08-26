
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'package)
(setq package-archives
      '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))


;;; use-package
(require 'use-package)
(setq use-package-always-ensure t)


(require 'init-util)
(require 'init-common)

;; load init-elpa before init-auto-complete
(require 'init-evil)
(require 'init-plugin)
(require 'init-completion)
(require 'init-c)
(require 'init-org)
(require 'init-web)

;; load custom.el if exist
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
