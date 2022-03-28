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
(set-face-attribute 'default nil
                    :family "Iosevka Term"
                    :height 150
                    :weight 'normal
                    :width 'normal)

; increase & decrease font size keybindings
(global-set-key (kbd "C-S-k") 'text-scale-increase) ; increase font
(global-set-key (kbd "C-S-j") 'text-scale-decrease) ; decrease font

; install doom themes
(use-package doom-themes
  :ensure t
  :init
  (load-theme 'doom-one t))

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
