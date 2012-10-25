(setq backup-directory-alist `((".*" . ,rwj-backup-dir)))
(setq auto-save-file-name-transforms `((".*" , rwj-backup-dir t)))

;; saveplace remembers your location in a file when saving files
(setq save-place-file (expand-file-name "saveplace" rwj-backup-dir))
;; activate it for all buffers
(setq-default save-place t)
(require 'saveplace)
