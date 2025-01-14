;; Repositories
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
    (package-install 'use-package))

;; Global Settings
(setq custom-file "~/.emacs.d/custom.el")
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)
(setq create-lockfiles nil)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)
(setq vc-follow-symlinks t)
(setq compilation-environment '("TERM=xterm-256color"))
(setq compilation-scroll-output 'first-error)
(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)

;; Appearance
(set-face-attribute 'default nil
		    :family "DejaVuSansM Nerd Font Mono"
		    :height 110)

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  ;; (load-theme 'doom-monokai-pro t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (custom-set-faces
   '(cursor ((t (:background "red"))))))

(use-package modus-themes
  :ensure t
  :config
  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs nil
	modus-themes-region '(bg-only)
	modus-themes-scale-headings t
	modus-themes-variable-pitch-ui nil
	modus-themes-completions
	'((matches . (extrabold background intense))
	  (selection . (semibold accented intense))
	  (popup . (accented))))
  (load-theme 'modus-vivendi-deuteranopia t))


;; Minibuffer Completion
(use-package ido
  :ensure nil
  :config
  (ido-mode 1))

(use-package smex
  :ensure t
  :bind
  (("M-x" . smex)
   ("M-X" . smex-major-mode-commands)))

;; Magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispach)))

;; Papis
(use-package f :ensure t)
(add-to-list 'load-path "~/.emacs.d/elisp/papis.el")
(require 'papis)

;; Projectile
(use-package projectile
  :ensure t
  :bind
  ("C-c p" . projectile-command-map)
  :config
  (projectile-mode +1)
  (setq projectile-cache-file (expand-file-name "projectile.cache" user-emacs-directory))
  (setq projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" user-emacs-directory))
  (setq projectile-indexing-method 'alien)
  (setq projectile-completion-system 'auto)
  (setq projectile-enable-caching t)
  (setq projectile-switch-project-action 'projectile-dired)
  :init
  (setq projectile-project-search-path '("~/Projects")))

(use-package projectile-ripgrep
  :ensure t
  :after projectile)

;; Completion
(use-package company
  :ensure t
  :config
  (global-company-mode t)
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; Evil
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (evil-define-key 'normal 'global (kbd "C-u") 'evil-scroll-up)
  (evil-define-key 'normal 'global (kbd "C-d") 'evil-scroll-down)
  (evil-define-key 'normal 'global (kbd "g c") 'comment-or-uncomment-region))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; Indent Guide
(use-package indent-guide
  :ensure t)

;; compile-mode
(require 'ansi-color)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

;; go-mode
(use-package go-mode
  :ensure t)

;; php-mode
(use-package php-mode
  :ensure t
  :mode ("\\.php``'" . php-mode))

;; json-mode
(use-package json-mode
  :ensure t
  :mode ("\\.json``'" . json-mode))

;; dockerfile-mode
(use-package dockerfile-mode
  :ensure t
  :mode ("Dockerfile\\'" . dockerfile-mode))

;; docker.el
(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

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

;; Terraform
(use-package terraform-mode
  :ensure t
  :mode ("\\.tf``" . terraform-mode)
  :custom
  (terraform-indent-level 4))

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
  (setq markdown-command "pandoc")
  :config
  (setq markdown-enable-math t)
  (setq markdown-hide-urls nil)
  (setq markdown-fontify-code-blocks-natively t))

;; org-mode
(use-package org
  :ensure t
  :hook ((org-mode . visual-line-mode)
	 (org-mode . flyspell-mode))
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :config
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "en_US")
  (setq ispell-change-dictionary "en_US")
  (setq org-log-done 'time)
  (setq org-hide-leading-stars t)
  (setq org-startup-indented t)
  (setq org-pretty-entities t)
  (setq org-ellipsis "⤵" )
  (setq org-hide-emphasis-markers t)
  (setq org-src-fontify-natively t)
  (setq org-agenda-files '("~/org/agenda.org"))

  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :weight bold :height 1.4))))
   '(org-level-2 ((t (:inherit outline-2 :weight bold :height 1.3))))
   '(org-level-3 ((t (:inherit outline-3 :weight bold :height 1.2))))
   '(org-level-4 ((t (:inherit outline-4 :weight bold :height 1.1))))
   '(org-level-5 ((t (:inherit outline-5 :weight bold :height 1.05))))
   '(org-level-6 ((t (:inherit outline-6 :weight bold :height 1.0))))
   '(org-level-7 ((t (:inherit outline-7 :weight bold :height 1.0))))
   '(org-level-8 ((t (:inherit outline-8 :weight bold :height 1.0))))))

(use-package org-superstar
  :ensure t
  :hook (org-mode . (lambda () (org-superstar-mode 1))))

;; pkl-mode
(use-package pkl-mode
  :ensure t
  :mode "\\.pkl\\'")

;; Treesitter
(setq treesit-extra-load-path '("/usr/local/lib"))
(use-package treesit
  :ensure nil
  :config
  (setq treesit-font-lock-level 4)
  (dolist (mode '((go-mode . go-ts-mode)
                  (python-mode . python-ts-mode)
                  (php-mode . php-ts-mode)
                  (javascript-mode . js-ts-mode)
                  (json-mode . json-ts-mode)
		  (sh-mode . bash-ts-mode)))
    (add-to-list 'major-mode-remap-alist mode)))

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

;; Custom Bindings
(use-package shell
  :ensure nil
  :bind (:map shell-mode-map
	      ("M-l" . comint-clear-buffer)))

(use-package eshell
  :ensure nil
  :bind (:map eshell-mode-map
	      ("M-l" . eshell/clear)))

(load-file "~/.emacs.d/elisp/mail.el") 
