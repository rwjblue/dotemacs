(defun rwj-prog-mode-setup ()
  (linum-mode 1)
  (whitespace-mode 1)
  (setq truncate-lines t)
  (setq indent-tabs-mode nil)
  (setq whitespace-style
        '(faces tabs tab-mark trailing lines-tail
                indentation::space empty tab-mark))
  (add-hook 'before-save-hook 'whitespace-cleanup))

(add-hook 'prog-mode-hook 'rwj-prog-mode-setup)

(setq nxhtml-global-minor-mode t
      mumamo-chunk-coloring 'submode-colored
      nxhtml-skip-welcome t
      indent-region-mode t
      rng-nxml-auto-validate-flag nil
      nxml-degraded t)
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo))

(rvm-use-default)

;; markdown-mode
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.mkdn" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; set hippie expand to take over
(global-set-key (kbd "M-/") 'hippie-expand)

;; smart pairing for all
(electric-pair-mode t)

;; make the file executable if it is a script (i.e. if it has #!)
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
