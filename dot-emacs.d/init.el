;; repositories
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; mu4e
;; (load-file "~/.emacs.d/elisp/mail.el") 

;; emacs
(use-package emacs
  :ensure nil
  :init
  (setq custom-file "~/.emacs.d/custom.el")
  (setq inhibit-startup-screen t
	inhibit-startup-echo-area-message t
	initial-scratch-message nil)
  (setq make-backup-files nil
	auto-save-default nil
	auto-save-list-file-prefix nil
	create-lockfiles nil)
  (setq compilation-environment '("TERM=xterm-256color")
	compilation-scroll-output 'first-error)
  (setq vc-follow-symlinks t)
  :config
  (fset 'yes-or-no-p 'y-or-n-p)
  (tool-bar-mode 0)
  (menu-bar-mode 0)
  (scroll-bar-mode 0)
  (blink-cursor-mode 0)
  (global-display-line-numbers-mode 1)
  (global-hl-line-mode 1)
  (column-number-mode 1)
  ;; (load-theme 'deeper-blue t)
  (set-face-attribute 'default nil
		      :family "Hack Nerd Font Mono"
		      :height 110)
  (custom-set-faces
   '(cursor ((t (:background "red"))))))

;; compile-mode
(use-package ansi-color
  :ensure nil
  :config
  (add-hook 'compilation-filter-hook 'ansi-color-compilation-filter))

;; shell-mode
(use-package shell
  :ensure nil
  :bind (:map shell-mode-map
	      ("M-l" . comint-clear-buffer)))

;; eshell-mode
(use-package eshell
  :ensure nil
  :bind (:map eshell-mode-map
	      ("M-l" . eshell/clear)))

;; doom-themes
(use-package doom-themes
  :if nil
  :ensure t
  :init
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;; modus-themes
(use-package modus-themes
  :if nil
  :ensure t
  :init
  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs nil
	modus-themes-region '(bg-only)
	modus-themes-scale-headings t
	modus-themes-variable-pitch-ui nil
	modus-themes-completions
	'((matches . (extrabold background intense))
	  (selection . (semibold accented intense))
	  (popup . (accented))))
  :config
  (load-theme 'modus-vivendi-deuteranopia t))

;; gruvbox-themes
(use-package gruvbox-theme
  :if nil
  :ensure t
  :config
  (load-theme 'gruvbox-dark-hard t))

;; gruber-darker theme
(use-package gruber-darker-theme
  :ensure t
  :config
  (load-theme 'gruber-darker t))

;; dired
(use-package dired
  :ensure nil
  :bind (:map dired-mode-map
	      ("C-c C-e" . wdired-change-to-wdired-mode)))

;; ido-mode
(use-package ido
  :ensure nil
  :config
  (ido-mode)
  (ido-everywhere 1))

;; smex
(use-package smex
  :ensure t
  :bind
  (("M-x" . smex)
   ("M-X" . smex-major-mode-commands)))

;; magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispach)))

;; projectile
(use-package projectile
  :ensure t
  :bind ("C-c p" . projectile-commander)
  :init
  (setq projectile-cache-file (expand-file-name "projectile.cache" user-emacs-directory)
	projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" user-emacs-directory)
	projectile-indexing-method 'alien
	projectile-completion-system 'auto
	projectile-enable-caching t
	projectile-switch-project-action 'projectile-dired
	projectile-project-search-path '("~/Projects"))
  :config
  (projectile-mode +1))

(use-package projectile-ripgrep
  :ensure t
  :after projectile)

;; company-mode
(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0.2
	company-minimum-prefix-length 1
	company-tooltip-align-annotations t)
  :bind (:map company-active-map
	     ("M-n" . nil)
	     ("M-p" . nil)
	     ("C-n" . company-select-next)
	     ("C-p" . company-select-previous))
  :config
  (global-company-mode t))

;; evil-mode
(use-package evil
  :if nil
  :ensure t
  :init
  (setq evil-want-integration t
	evil-want-keybinding nil)

  (setq evil-normal-state-cursor '(box "red")
	evil-insert-state-cursor '(box "red")
	evil-visual-state-cursor '(box "red"))
  :config
  (evil-mode 1)
  (evil-set-leader nil (kbd "SPC"))
  (evil-define-key 'normal 'global (kbd "C-u") 'evil-scroll-up)
  (evil-define-key 'normal 'global (kbd "C-d") 'evil-scroll-down)
  (evil-define-key 'normal 'global (kbd "g c") 'comment-or-uncomment-region)
  (evil-define-key 'normal 'normal (kbd "<leader>g") 'magit-status))

;; evil-collection
(use-package evil-collection
  :if nil
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; evil-surround
(use-package evil-surround
  :if nil
  :after evil
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; hl-todo-mode
(use-package hl-todo
  :ensure t
  :init
  (setq hl-todo-keyword-faces
	'(("TODO"  . "#FF0000")
	  ("FIXME" . "#FF0000")
	  ("DEBUG" . "#A020F0")
	  ("NOTE"  . "#FF4500")
	  ("STUB"  . "#1E90FF")))
  :config
  (global-hl-todo-mode 1))

;; go-mode
(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode))

;; php-mode
(use-package php-mode
  :ensure t
  :mode ("\\.php\\'" . php-mode))

;; json-mode
(use-package json-mode
  :ensure t
  :mode ("\\.json\\'" . json-mode))

;; docker.el
(use-package docker
  :ensure t
  :defer t
  :bind ("C-c d" . docker))

;; dockerfile-mode
(use-package dockerfile-mode
  :ensure t
  :mode ("Dockerfile\\'" . dockerfile-mode))

;; docker-compose-mode
(use-package docker-compose-mode
  :ensure t
  :mode ("docker-compose.yml\\'" . docker-compose-mode))

;; yaml-mode
(use-package yaml-mode
  :ensure t
  :mode ("\\.yaml\\'" . yaml-mode)
  :mode ("\\.yml\\'" . yaml-mode)
  :config
  (setq yaml-indent-offset 2))

;; ansible-mode
(use-package ansible
  :ensure t
  :hook ((yaml-mode . (lambda ()
			(when (or (string-match "\\.ansible\\.yaml\\'" buffer-file-name)
				  (string-match "\\.ansible\\.yml\\'" buffer-file-name))
			  (ansible-mode))))))

;; terraform-mode
(use-package terraform-mode
  :ensure t
  :mode ("\\.tf``" . terraform-mode)
  :custom
  (terraform-indent-level 4))

;; nix-mode
(use-package nix-mode
  :ensure t
  :mode ("\\.nix\\'" . nix-mode)
  :bind (:map nix-mode-map
	      ("M-l" . comint-clear-buffer)))

;; tuareg-mode
(use-package tuareg
  :ensure t
  :mode ("\\.ml\\'" . tuareg-mode)
  :config
  (setq tuareg-indent-level 2))

;; markdown-mode
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "pandoc"
	markdown-enable-math t
	markdown-hide-urls nil
	markdown-fontify-code-blocks-natively t))

;; org-mode
(use-package org
  :ensure t
  :init
  (setq ispell-program-name "hunspell"
	ispell-dictionary "en_US"
	ispell-change-dictionary "en_US"
	org-log-done 'time
	org-hide-leading-stars t
	org-startup-indented t
	org-pretty-entities t
	org-ellipsis "⤵" 
	org-hide-emphasis-markers t
	org-src-fontify-natively t
	org-agenda-files '("~/org/agenda.org"))
  :hook ((org-mode . visual-line-mode)
	 (org-mode . flyspell-mode))
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :config
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :weight bold :height 1.4))))
   '(org-level-2 ((t (:inherit outline-2 :weight bold :height 1.3))))
   '(org-level-3 ((t (:inherit outline-3 :weight bold :height 1.2))))
   '(org-level-4 ((t (:inherit outline-4 :weight bold :height 1.1))))
   '(org-level-5 ((t (:inherit outline-5 :weight bold :height 1.05))))
   '(org-level-6 ((t (:inherit outline-6 :weight bold :height 1.0))))
   '(org-level-7 ((t (:inherit outline-7 :weight bold :height 1.0))))
   '(org-level-8 ((t (:inherit outline-8 :weight bold :height 1.0))))))

;; org-superstar-mode
(use-package org-superstar
  :ensure t
  :hook (org-mode . (lambda () (org-superstar-mode 1))))

;; pkl-mode
(use-package pkl-mode
  :ensure t
  :mode "\\.pkl\\'")

;; treesitter
(setq treesit-extra-load-path '("/usr/local/lib"))
(use-package treesit
  :ensure nil
  :init
  (setq treesit-font-lock-level 4)
  :config
  (dolist (mode '((go-mode . go-ts-mode)
                  (python-mode . python-ts-mode)
                  (php-mode . php-ts-mode)
                  (javascript-mode . js-ts-mode)
                  (json-mode . json-ts-mode)
		  (sh-mode . bash-ts-mode)))
    (add-to-list 'major-mode-remap-alist mode)))

;; eglot
(use-package eglot
  :ensure t
  :bind
  (("C-c r" . eglot-rename)
   ("C-c d" . eglot-find-declaration)
   ("C-c f" . eglot-format)
   ("C-c a" . eglot-code-actions)
   ("C-c e" . eglot-show-diagnostics)
   ("C-c h" . eldoc)
   ("C-c g" . xref-find-definitions)
   ("C-c b" . xref-go-back)
   ("C-c r" . xref-find-references))
  :config
  (add-to-list 'eglot-server-programs '(go-ts-mode . ("gopls")))
  (add-to-list 'eglot-server-programs '(python-ts-mode . ("pyright-langserver" "--stdio")))
  (add-to-list 'eglot-server-programs '(bash-ts-mode . ("bash-language-server" "start")))
  (add-to-list 'eglot-server-programs '(dockerfile-mode . ("docker-langserver" "--stdio")))
  (add-to-list 'eglot-server-programs '(c-ts-mode . ("clangd")))
  (add-to-list 'eglot-server-programs '(cpp-ts-mode . ("clangd")))
  (add-hook 'go-mode-hook 'eglot-ensure)
  (add-hook 'python-mode-hook 'eglot-ensure))

;; custom functions
(use-package emacs
  :ensure nil
  :bind ("C-x t" . od/open-alacritty-in-cwd)
  :config
  (defvar od/terminal "/usr/local/bin/kitty"
    "Path to the terminal executable.")

  (defun od/open-alacritty-in-cwd ()
    "Open terminal in the current working directory."
    (interactive)
    (let ((cwd default-directory))
      (start-process "terminal" nil od/terminal "--working-directory" cwd))))
