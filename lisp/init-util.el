;; Show warn message after press C-x C-c
(defun my:exit-emacs ()
  "Show warn message before exit emacs"
  (interactive)
  ;; (message "Exit emacs? (y)")
  (if (string= "y" (read-key-sequence "Exit emacs? (y)"))
      (save-buffers-kill-emacs)
    (message "Press y to exit emacs.")))

;; (global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "C-x C-c") 'my:exit-emacs)

;; highlight search keyword
(defvar my:highlight-keyword-len 2
  "Minimum length of keyword to be highlighted.")
(defvar-local my:highlight-keyword-str nil
  "Keyword to be highlighted.")
(defvar-local my:highlight-keyword-prev-str nil
  "Previous highlighted keyword.")

;;(defun my:highlight-keyword(&rest args)
;;  "Highlight search keyword."
;;  (interactive)
;;  (setq my:highlight-keyword-prev-str my:highlight-keyword-str)
;;  (if isearch-regexp
;;      (setq my:highlight-keyword-str (car-safe regexp-search-ring))
;;    (setq my:highlight-keyword-str (car-safe search-ring)))
;;  (when (and (>= (length my:highlight-keyword-str) my:highlight-keyword-len)
;;             (not (string-equal my:highlight-keyword-str
;;                                my:highlight-keyword-prev-str)))
;;    (unhighlight-regexp my:highlight-keyword-prev-str)
;;    (highlight-regexp my:highlight-keyword-str 'evil-ex-search)))

(advice-add 'isearch-exit :after 'my:highlight-keyword)
;;(advice-add 'evil-search :after 'my:highlight-keyword)
;;(advice-add 'evil-search-next :after 'my:highlight-keyword)
;;(advice-add 'evil-search-previous :after 'my:highlight-keyword)
;;(advice-add 'evil-search-incrementally :after 'my:highlight-keyword)

(defun my:resize-frame-font-size (frame &optional size)
  "Resize FRAME by SIZE.
SIZE default is 150"
  (let ((frame-size (if (eq nil size) 150 size)))
    (set-face-attribute 'default frame :height frame-size)
    ))

(defun my:compile-now ()
  "Compile without prompt."
  (interactive)
  (let ((compilation-read-command nil))
    (compile "make -k")
    ))

(defun my:generic-open-command ()
  "Get open command.
return 'xdg-open' for linux, 'open' for osx."
  (cond ((string= system-type "darwin") "open")
        ((string= system-type "gnu/linux") "xdg-open")
        (t "unknown-open-command")))

(defun my:open-file (&optional filename)
  "Open file using external program.
If FILENAME not provided, select file from disk."
  (interactive)
  (let ((filename (if (eq filename nil)
                      (read-file-name "Choose file: ")
                    filename)))
    ;; (message (format "open command is: %s" (my:generic-open-command)))
    (start-process-shell-command "open" "*Messages*" (format "%s %s" (my:generic-open-command) filename))))

(defun my:pandoc-export-file-to-html (&optional filename)
  "Export file to html, return html file path.
If FILENAME not provided, select file from disk."
  (interactive)
  (let* ((srcfilename (if (eq filename nil)
                          (read-file-name "Choose file: ")
                        filename))
         (htmlfilename (format "%s.html" (file-name-sans-extension srcfilename)))
         (pandoc-cmd (format "pandoc %s -o %s -s --highlight-style=pygments --toc --toc-depth=5" srcfilename htmlfilename))
         )
    (message pandoc-cmd)
    (start-process-shell-command "pandoc" "*Messages*" pandoc-cmd)
    htmlfilename
    ))

(defun my:pandoc-export-file-to-html-and-open ()
  "Export file to html and open html in browser."
  (interactive)
  (let* ((filename (read-file-name "Choose file: "))
         (htmlfilename (my:pandoc-export-file-to-html filename)))
    (message (format "html file name: %s" htmlfilename))
    (my:open-file htmlfilename)
    ))

(defun my:plantuml-export-current-file-to-svg-and-open ()
  "Export current file to svg, file name is current buffer name."
  (interactive)
  (let ((svgfilename (format "%s.svg"
                             (file-name-sans-extension buffer-file-truename)))
        )
    (my:plantuml-export-file-to-svg buffer-file-truename)
    (message (format "svg file name is '%s'" svgfilename))
    (my:open-file svgfilename)
    )
  )

(defun my:search-in-current-dir ()
  "Search in current directory"
  (interactive)
  (consult-ripgrep default-directory))

(defun my:choose-dir-and-search ()
  "Choose directory and search"
  (interactive)
  (let* ((choosed-dir (read-directory-name "Choose Dir: ")))
    (consult-ripgrep choosed-dir)))

(defun my:plantuml-export-file-to-svg (&optional filename)
  "Export file to svg, return svg file path.
If FILENAME not provided, select file from disk."
  (interactive)
  (let ((srcfilename (if (eq filename nil)
                         (read-file-name "Choose file: ")
                       filename))
        )
    ;; (message srcfilename)
    (call-process "plantuml" nil "*plantuml-export*" nil "-tsvg" (expand-file-name srcfilename))
    ))

;; (setq plantuml-jar-path "/usr/local/Cellar/plantuml/1.2017.13/libexec/plantuml.jar")
(defvar my:generic-convert-and-open-function nil)

(add-hook 'plantuml-mode-hook
          (lambda () (setq-local my:generic-convert-and-open-function
                                 'my:plantuml-export-current-file-to-svg-and-open)))

(global-set-key (kbd "C-c C-o") (lambda ()
                                  (interactive)
                                  (funcall my:generic-convert-and-open-function)))

(defun my:add-to-env-path()
  "Add path to PATH environment variable."
  (interactive)
  (let ((path (read-directory-name "Choose directory: ")))
    (my:do-add-to-env "PATH" path)))

(defun my:do-add-to-env(envname path)
  "Add PATH to ENVNAME."
  (let ((env-vals (split-string (getenv envname) ":")))
    (setenv envname (mapconcat 'identity (cons path (remove path env-vals)) ":")))
  )

(provide 'init-util)
