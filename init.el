(setq rwj-emacs-config-dir (file-name-directory load-file-name))
(setq rwj-backup-dir (expand-file-name "backups" rwj-emacs-config-dir))
(setq rwj-config-dir (expand-file-name "config" rwj-emacs-config-dir))


(unless (file-exists-p rwj-backup-dir)
  (make-directory rwj-backup-dir))

;; config changes made through the customize UI will be store here
(setq custom-file
      (expand-file-name "emacs-customizations.el" rwj-emacs-config-dir))

(require 'cl)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)

;; list of packages to ensure are loaded at launch
(setq rwj-packages
      '(ack-and-a-half coffee-mode eieio exec-path-from-shell
	flymake flymake-ruby flymake-shell
	expand-region gh gist guru-mode haml-mode htmlize inflections
	inf-ruby magit magithub multi-term org-plus-contrib rinari rvm
	scss-mode yasnippet xml-rpc molokai-theme solarized-theme
	zenburn-theme))

(el-get 'sync rwj-packages)

;; Load all elisp files in ./config
(if (file-exists-p rwj-config-dir)
    (dolist (file (directory-files rwj-config-dir t "\\.el$"))
      (load file)))
