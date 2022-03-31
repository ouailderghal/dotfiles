; include MELPA repository
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

; if use-package is not installed, refresh packages list & install use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

; personal information ========================================================

(setq user-full-name "Ouail Derghal"
      user-mail-address "ouail.derghal@univ-constantine2.dz"
      calendar-latitude 36.35
      calendar-longitude 6.6
      calendar-location-name "Constantine, Algeria")

; ui configuration ============================================================

; clean ui
(setq inhibit-startup-message t) ; disable startup message
(tool-bar-mode 0) ; disable tool bar
(menu-bar-mode 0) ; disable menu bar
(scroll-bar-mode -1) ; disable scroll bar

; doom-themes
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-badger t))

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


; backup =================================================================
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

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

; evil surround
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

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

; engine mode
(use-package engine-mode
  :ensure t
  :config
  (engine-mode t))

(engine/set-keymap-prefix (kbd "C-c s"))

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")

(defengine wikipedia
  "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :keybinding "w")

(defengine scholar
  "https://scholar.google.com/scholar?hl=en&q=%s"
  :keybinding "s")

(defengine google-images
  "http://www.google.com/images?hl=en&source=hp&biw=1440&bih=795&gbv=2&aq=f&aqi=&aql=&oq=&q=%s")

(defengine github
  "https://github.com/search?ref=simplesearch&q=%s")

(defengine youtube
  "http://www.youtube.com/results?aq=f&oq=&search_query=%s")

;==============================================================================
