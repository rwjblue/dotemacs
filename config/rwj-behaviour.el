;; show matching parens
(show-paren-mode 1)

;; always show column numbers
(column-number-mode 1)

;; Narrow (C-x n n)
(put 'narrow-to-region 'disabled nil)

;; take the short answer, y/n is yes/no
(defalias 'yes-or-no-p 'y-or-n-p)
