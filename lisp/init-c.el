;;; init-c --- Summary:
;;; Commentary:
;;; Code:

;; Install cppcheck https://github.com/danmar/cppcheck/releases
;; set CFGDIR=/usr/share/cppcheck when run make and make install

;; DO NOT USE GNU STYLE OF INDENTING
(setq c-default-style "linux")
(setq c-basic-offset 4)

;; make '_' as a word character
(add-hook 'c-mode-common-hook
          (lambda () (progn
                       (modify-syntax-entry ?_ "w")
                       (modify-syntax-entry ?_ "w"))))

(provide 'init-c)
;;; init-c.el ends here
