(defun defaults/quiet-startup ()
  "Inhibit the startup message and clear scratch buffer."
  (setq inhibit-startup-message t)
  (setq initial-scratch-message nil))

(defun defaults/clean-startup ()
  "Remove toolbar, menubar and scrollbar"
  (tool-bar-mode 0)
  (menu-bar-mode 0)
  (scroll-bar-mode -1))

(defun defaults/append-new-line ()
  "If the new line doesnt't end with a new line, append one."
  (setq require-final-new-line t))

(defun defaults/confirm-closing-emacs ()
  "Ask if syre that you want to close Eamcs."
  (setq confirm-kill-emacs 'y-or-n-p))

(defun defaults/shorten-yes-or-no ()
  "Don't ask `yes/no?', ask `y/n?'."
  (fset 'yes-or-no-p 'y-or-n-p))

(defun defaults/backup-to-tmp-directory ()
  "Save backup files in /tmp instead of current file tree."
 (setq backup-directory-alist
       `((".*" . ,temporary-file-directory)))
 (setq auto-save-file-name-transforms
       `((".*" ,temporary-file-directory t))))

(defun defaults/always-follow-symlinks ()
  "Always follow symlinks."
  (setq vc-follow-symlinks t))

(defun defaults/never-follow-symlinks ()
  "Never follow symlinks."
  (setq vc-follow-symlinks nil))

(defun defaults/never-confirm-org-babel-evaluate ()
  "Disable confirmation message when loading Org files with babel."
  (setq org-confirm-babel-evaluate nil))

(defun defaults/all-settings ()
  "Use all default settings."
  (defaults/quiet-startup)
  (defaults/clean-startup)
  (defaults/append-new-line)
  (defaults/confirm-closing-emacs)
  (defaults/shorten-yes-or-no)
  (defaults/never-follow-symlinks)
  (defaults/never-confirm-org-babel-evaluate))

