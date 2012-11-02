(require 'ansi-color)
(require 'multi-term)

(setq multi-term-program (expand-file-name "eshell.sh" rwj-emacs-config-dir))

(defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)

(defun rwj-term-init ()
  (multi-term-keystroke-setup)
  (local-set-key (kbd "<f2>") 'rename-buffer)
  (ansi-color-for-comint-mode-on))
  ;(set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))

(add-hook 'term-mode-hook
          'rwj-term-init)

(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term) ;; create a new one
