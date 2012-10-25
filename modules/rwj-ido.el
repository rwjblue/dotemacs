(ido-mode t)
(setq ido-enable-flex-matching t)

;; IDO becomes very hectic when creating a new file. If you don't
;; type the new file name fast enough, it searches for existing files
;; in other directories with the same name and opens them instead.
;; The following setting disables that feature.
(setq ido-auto-merge-work-directories-length -1)
