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

;==============================================================================
