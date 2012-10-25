(setq backup-directory-alist `((".*" . ,rwj-backup-dir)))
(setq auto-save-file-name-transforms `((".*" ,rwj-backup-dir t)))

(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 5
  version-control t)

;; saveplace remembers your location in a file when saving files
(setq save-place-file (expand-file-name "saveplace" rwj-backup-dir))
;; activate it for all buffers
(setq-default save-place t)
(require 'saveplace)
