; include MELPA repository
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

; if use-package is not installed, refresh packages list & install use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

; ui configuration ============================================================

; clean ui
(setq inhibit-startup-message t) ; disable startup message
(tool-bar-mode 0) ; disable tool bar
(menu-bar-mode 0) ; disable menu bar
(scroll-bar-mode -1) ; disable scroll bar

; line numbers
(require 'display-line-numbers)

(defcustom display-line-numbers-exempt-modes
  '(vterm-mode eshell-mode shell-mode term-mode ansi-term-mode dired-mode)
  "Major modes on which to disable line numbers."
  :group 'display-line-numbers
  :type 'list
  :version "green")

(defun display-line-numbers--turn-on ()
  "Turn on line numbers except for certain major modes."
  (unless (or (minibufferp)
              (member major-mode display-line-numbers-exempt-modes))
    (display-line-numbers-mode)))

(setq display-line-numbers-type 'relative) ; set line numbers typer to relative
(global-display-line-numbers-mode 1) ; enable line numbers

; font configuration
(setq od/default-fixed-font "Inconsolata")
(setq od/default-fixed-font-size 130)
(setq od/font-change-increment 1.1)

(setq od/current-fixed-font-size od/default-fixed-font-size)

(set-face-attribute 'default nil
		    :family od/default-fixed-font
		    :height od/default-fixed-font-size)

(set-face-attribute 'fixed-pitch nil
		    :family od/default-fixed-font
		    :height od/default-fixed-font-size)

(defun od/set-font-size ()
  "Change default and fixed-pitch font sizes."
  (set-face-attribute 'default nil
		      :height od/current-fixed-font-size)
  (set-face-attribute 'fixed-pitch nil
		      :height od/current-fixed-font-size))

(defun od/increase-font-size ()
  "Increase current font size by a factor."
  (interactive)
  (setq od/current-fixed-font-size
	(ceiling (* od/current-fixed-font-size od/font-change-increment)))
  (od/set-font-size))

(defun od/decrease-font-size ()
  "Decrease current font size by a factor down to a min size of 1."
  (interactive)
  (setq od/current-fixed-font-size
	(max 1
	     (floor (/ od/current-fixed-font-size od/font-change-increment))))
  (od/set-font-size))

(defun od/reset-font-size ()
  "Reset font size to the default value."
  (interactive)
  (setq od/current-fixed-font-size od/default-fixed-font-size)
  (od/set-font-size))

; increase, decrease and reset font size keybindings
(global-set-key (kbd "C-S-k") 'od/increase-font-size) ; increase font
(global-set-key (kbd "C-S-j") 'od/decrease-font-size) ; decrease font
(global-set-key (kbd "C-=") 'od/reset-font-size) ; reset font

; evil ===================================================================

; evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode)) ; enable evil mode

; evil numbers
; this package permits you to increase and decrease numbers in text files
(use-package evil-numbers
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "C-c =") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt))

; org mode ====================================================================

; org superstar
; UFT-8 bullets in org mode
(use-package org-superstar
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

; org ellipsis symbol
(setq org-ellipsis " ↴")

; extra packages ==============================================================

; ido mode
(use-package ido
  :ensure t
  :config
  (ido-mode t))

; rainbow mode
; show HEX colors in the editor
(use-package rainbow-mode
  :ensure t)

;==============================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "333958c446e920f5c350c4b4016908c130c3b46d590af91e1e7e2a0611f1e8c5" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
