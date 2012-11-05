(require 'yasnippet)
(yas/global-mode 1)

;; Add custom snippets
(yas/load-directory (expand-file-name "snippets" rwj-emacs-config-dir))

;; yasnippet and org-mode don't play well together when using TAB
;; for completion. This disables yasnippet when in org-mode
(add-hook 'org-mode-hook (lambda () (yas-minor-mode -1)))
