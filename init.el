(setq rwj-emacs-config-dir (file-name-directory load-file-name))
(setq rwj-backup-dir (expand-file-name "backups" rwj-emacs-config-dir))
(setq rwj-config-dir (expand-file-name "config" rwj-emacs-config-dir))


(unless (file-exists-p rwj-backup-dir)
  (make-directory rwj-backup-dir))

;; config changes made through the customize UI will be store here
(setq custom-file
      (expand-file-name "emacs-customizations.el" rwj-emacs-config-dir))

;; setup packages
(require 'cl)
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("ELPA" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;; required because of a package.el bug
(setq url-http-attempt-keepalives nil)

(when (not package-archive-contents)
  (package-refresh-contents))

;; list of packages to ensure are loaded at launch
(setq rwj-packages
      '(ack-and-a-half coffee-mode eieio exec-path-from-shell
	flymake flymake-ruby flymake-shell
	expand-region gh gist guru-mode haml-mode htmlize inflections
	inf-ruby magit magithub multi-term org-plus-contrib rinari rvm
	scss-mode yasnippet xml-rpc molokai-theme solarized-theme
	zenburn-theme))

(defun rwj-packages-installed-p ()
  (loop for p in rwj-packages
	when (not (package-installed-p p)) do (return nil)
	finally (return t)))

(unless (rwj-packages-installed-p)
  ;; check for new packages (package versions)
  (package-refresh-contents)
  ;; install the missing packages
  (dolist (p rwj-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; Load all elisp files in ./config
(if (file-exists-p rwj-config-dir)
    (dolist (file (directory-files rwj-config-dir t "\\.el$"))
      (load file)))
