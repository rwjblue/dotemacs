(add-hook 'prog-mode-hook
	  (lambda ()
	    (linum-mode 1)            ;; line numbers
	    (whitespace-mode 1)       ;; show whitespace
	    (setq truncate-lines t)   ;; truncate line (no word wrap)
	    (add-hook 'before-save-hook 'whitespace-cleanup nil t)))


;; associate rhtml-mode with .html.erb files
(autoload 'rhtml-mode "rhtml-mode" "RHTML Mode" t)
(add-to-list 'auto-mode-alist '("\\.rhtml$" rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb$" rhtml-mode))

;; markdown-mode
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.mkdn" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;; use rvm’s default ruby for the current Emacs session
(rvm-use-default)

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

;; smart pairing for all
(electric-pair-mode t)
