;;; init-evil --- evil config
;;; Commentary:
;;; Code:

(use-package undo-fu)

(use-package evil
  :init
  ;; change ctrl-z to avoid enter evil-emacs-state
  (setq evil-toggle-key "C-x e v i l")
  (setq evil-undo-system 'undo-fu)

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


(use-package general
  :config
  (general-create-definer my-leader-def
    :states '(normal visual insert motion emacs)
    :keymaps 'override
    :prefix "\\"
    :non-normal-prefix "M-\\")
  (my-leader-def
    "j"  'avy-goto-char)
  (my-leader-def
    :keymaps 'prog-mode-map
    "d" 'xref-find-definitions
    "3d" 'xref-find-definitions-other-window
    "r" 'xref-find-references
    "sp" 'consult-ripgrep
    "sc" 'my:search-in-current-dir
    "sd" 'my:choose-dir-and-search))


(use-package evil-multiedit
  :ensure t
  :after evil
  :config
  (evil-multiedit-default-keybinds)
  )


(provide 'init-evil)
;;; init-evil.el ends here
