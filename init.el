
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


;; (require 'org)
;; (defun my:org-babel-load-file (filename &optional folder)
;;   "Load org file FILENAME as init file.
;; If FOLDER provided, then look for file in folder."
;;   (interactive)
;;   (let ((fullpath (expand-file-name
;;                    filename
;;                    (if folder
;;                        (expand-file-name folder user-emacs-directory)
;;                      (expand-file-name user-emacs-directory)))))
;;     (message fullpath)
;;     (org-babel-load-file fullpath)))

;; (my:org-babel-load-file "org/init-golang.org")
;; (my:org-babel-load-file "org/init-vc.org")
;; (my:org-babel-load-file "org/init-org.org")

;;; use-package
(require 'use-package)
(setq use-package-always-ensure t)


(require 'init-util)
(require 'init-common)

;; load init-elpa before init-auto-complete
(require 'init-evil)
(require 'init-plugin)
(require 'init-completion)
(require 'init-lsp)
;;(require 'init-ido)
;;(require 'init-helm)
(require 'init-c)
(require 'init-python)
(require 'init-javascript)
(require 'init-coffee)
(require 'init-terminal)
(require 'init-rust)
(require 'init-golang)
(require 'init-vc)
(require 'init-org)
(require 'init-web)
(require 'init-typescript)

;; load custom.el if exist
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
