;;; init-golang --- golang config
;;; Commentary:
;;; Code:

(use-package go-mode
  :mode "\\.go\\'"
  :config
  (add-hook 'go-mode-hook '(lambda () (add-hook 'before-save-hook 'gofmt-before-save nil t)))
  (setq gofmt-command "goimports")
  )

(defvar my:goenvs '(("rawgoenv" "~/go" "~/pkg/go" "~/pkg/go/bin"))
  "List of (GOPATH GOROOT gobinpath).")

(defun my:setgoenv()
  (interactive)
  (let ((goenv-choosed (completing-read "Choose One: " (mapcar 'car my:goenvs)))
        result)
    (dolist (goenv my:goenvs result)
      (if (string= (car goenv) goenv-choosed)
          (setq result (cdr goenv))))
    (my:do-setgoenv (nth 0 result) (nth 1 result) (nth 2 result))
    ))

(defun my:do-setgoenv(gopath goroot gobinpath)
  "Set GOPATH and GOROOT environment variable, add GOBINPATH to PATH."
  (setenv "GOPATH" (expand-file-name gopath))
  (setenv "GOROOT" (expand-file-name goroot))
  (message (format "gobinpath %s" (expand-file-name gobinpath)))
  (my:do-add-to-env "PATH" (expand-file-name gobinpath)))

(defun my:setgopath()
  "Set GOPATH environment variable."
  (interactive)
  (let ((mypath (read-directory-name "Choose directory: ")))
    (message (format "Setting GOPATH to %s" mypath))
    (setenv "GOPATH" mypath)
    ))

(defun my:setgoroot()
  "Set GOROOT environment variable."
  (interactive)
  (let ((mypath (read-directory-name "Choose directory: ")))
    (message (format "Setting GOROOT to %s" mypath))
    (setenv "GOROOT" mypath)
    ))

(provide 'init-golang)
;;; init-golang.el ends here
