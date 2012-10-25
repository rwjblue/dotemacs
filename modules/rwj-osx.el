;; fix path on OSX
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
