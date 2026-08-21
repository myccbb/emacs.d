;;; init-evil --- evil config
;;; Commentary:
;;; Code:


(use-package evil
  :init
  ;; change ctrl-z to avoid enter evil-emacs-state
  (setq evil-toggle-key "C-x e v i l")

  :config
  (evil-mode t)

  ;; remap :q[uit] to evil-kill-current-buffer
  (evil-define-command evil-kill-current-buffer ()
    "Kill current buffer"
    (kill-this-buffer))
  (evil-ex-define-cmd "q[uit]" 'evil-kill-current-buffer)

  ;; remap :wq to evil-save-and-kill-current-buffer
  (evil-define-command evil-save-and-kill-current-buffer ()
    "Save and kill current buffer"
    (save-some-buffers t)
    (kill-this-buffer))
  (evil-ex-define-cmd "wq" 'evil-save-and-kill-current-buffer)

  ;; rewrite evil-save-and-quit
  ;; remap :wqa[ll] to evil-save-and-quit
  (evil-define-command evil-save-and-quit ()
    "Save all buffers and exit emacs"
    ;; Origional evil-save-and-quit was defined in evil-commmands.el
    (save-buffers-kill-emacs))
  (evil-ex-define-cmd "wqa[ll]" 'evil-save-and-quit)

  ;; remap :x[it] :exi[t] to evil-save-and-kill-current-buffer
  (evil-ex-define-cmd "x[it]" 'evil-save-and-kill-current-buffer)
  (evil-ex-define-cmd "exi[t]" "xit")

  ;; remap :xa[ll] to evil-save-and-quit
  (evil-ex-define-cmd "xa[ll]" 'evil-save-and-quit)

  ;; remap "ZZ" to evil-save-and-quit
  (define-key evil-normal-state-map "ZZ" 'evil-save-and-quit)
  (define-key evil-normal-state-map "ZQ" 'evil-quit-all)
  )

(use-package evil-surround
  :config
  (global-evil-surround-mode t)
  )

(use-package evil-leader
  :config
  (global-evil-leader-mode)

  ;; key maps for helm-gtags
  (evil-leader/set-key "]" 'helm-gtags-find-tag-from-here)
  (evil-leader/set-key "[" 'helm-gtags-pop-stack)
  (evil-leader/set-key "gu" 'helm-gtags-update-tags)
  (evil-leader/set-key "gt" 'helm-gtags-find-tag)
  (evil-leader/set-key "gr" 'helm-gtags-find-rtag)
  (evil-leader/set-key "gp" 'helm-gtags-pop-stack)

  ;; key maps for avy
  (evil-leader/set-key "j" 'avy-goto-char)

  ;; key maps for python mode
  (evil-leader/set-key-for-mode 'python-mode "d" 'xref-find-definitions)
  (evil-leader/set-key-for-mode 'python-mode "3d" 'xref-find-definitions-other-window)
  (evil-leader/set-key-for-mode 'python-mode "r" 'lsp-find-references)

  ;; key maps for golang mode
  (evil-leader/set-key-for-mode 'go-mode "d" 'xref-find-definitions)
  (evil-leader/set-key-for-mode 'go-mode "3d" 'xref-find-definitions-other-window)
  (evil-leader/set-key-for-mode 'go-mode "r" 'lsp-find-references)

  ;; key maps for rust mode
  (evil-leader/set-key-for-mode 'rust-mode "d" 'xref-find-definitions)
  (evil-leader/set-key-for-mode 'rust-mode "3d" 'xref-find-definitions-other-window)
  (evil-leader/set-key-for-mode 'rust-mode "r" 'lsp-find-references)

  ;; key maps for typescript mode
  (evil-leader/set-key-for-mode 'typescript-mode "d" 'xref-find-definitions)
  (evil-leader/set-key-for-mode 'typescript-mode "3d" 'xref-find-definitions-other-window)
  (evil-leader/set-key-for-mode 'typescript-mode "r" 'lsp-find-references)
  )


(provide 'init-evil)
;;; init-evil.el ends here
