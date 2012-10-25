(require 'org)
(require 'org-src)  ;; edit src inline
(require 'htmlize)  ;; required for export

(add-hook 'org-mode-hook
	  (lambda ()
	    (toggle-truncate-lines)))
