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
 :family "FiraMono Nerd Font Mono"
 :height 130)

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-hard t))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  ; (load-theme 'doom-ir-black t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (custom-set-faces
   '(cursor ((t (:background "red"))))))

;; Minibuffer Completion
(use-package ivy
  :ensure t
  :diminish
  :bind (("C-s" . isearch-forward)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line))
  :config
  (ivy-mode 1))

(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;; Magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispach)))

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
  (evil-mode 1))

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

;; dockerfile-mode
(use-package dockerfile-mode
  :ensure t
  :mode ("Dockerfile\\'" . dockerfile-mode))

;; yaml-mode
(use-package yaml-mode
  :ensure t
  :mode ("\\.yaml``'" . yaml-mode)
  :mode ("\\.yml``'" . yaml-mode)
  :config
  (setq yaml-indent-offset 2))

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
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :config
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
  (add-to-list 'eglot-server-programs '(dockerfile-ts-mode . ("docker-langserver" "--stdio")))
  (add-to-list 'eglot-server-programs '(c-ts-mode . ("clangd")))
  (add-to-list 'eglot-server-programs '(cpp-ts-mode . ("clangd")))
  (add-hook 'go-mode-hook 'eglot-ensure)
  (add-hook 'python-mode-hook 'eglot-ensure))

;; Custom Functions
(defun od/duplicate-line()
  "Duplicate the current line."
  (interactive)
  (let ((current-line (buffer-substring (line-beginning-position) (line-end-position))))
    (end-of-line)
    (newline)
    (insert current-line)))

(defun od/clear-shell-buffer ()
  "Clear the current shell buffer."
  (interactive)
  (comint-clear-buffer))

;; Custom Bindings
(global-set-key (kbd "C-c d") 'od/duplicate-line)
(global-set-key (kbd "M-l") 'od/clear-shell-buffer)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" "19a2c0b92a6aa1580f1be2deb7b8a8e3a4857b6c6ccf522d00547878837267e7" "f4d1b183465f2d29b7a2e9dbe87ccc20598e79738e5d29fc52ec8fb8c576fcfd" "4ade6b630ba8cbab10703b27fd05bb43aaf8a3e5ba8c2dc1ea4a2de5f8d45882" "2b20b4633721cc23869499012a69894293d49e147feeb833663fdc968f240873" "f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66" "c8c4baac2988652a760554e0e7ce11a0fe0f8468736be2b79355c9d9cc14b751" "48042425e84cd92184837e01d0b4fe9f912d875c43021c3bcb7eeb51f1be5710" default))
 '(package-selected-packages
   '(evil-surround evil-collection evil-mode evil php-mode indent-guide projectile-ripgrep projectile pkl-mode plantuml-mode yaml-mode vertico orderless markdown-mode marginalia magit ivy gruvbox-theme go-mode dockerfile-mode company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "red"))))
 '(org-level-1 ((t (:inherit outline-1 :weight bold :height 1.4))))
 '(org-level-2 ((t (:inherit outline-2 :weight bold :height 1.3))))
 '(org-level-3 ((t (:inherit outline-3 :weight bold :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :weight bold :height 1.1))))
 '(org-level-5 ((t (:inherit outline-5 :weight bold :height 1.05))))
 '(org-level-6 ((t (:inherit outline-6 :weight bold :height 1.0))))
 '(org-level-7 ((t (:inherit outline-7 :weight bold :height 1.0))))
 '(org-level-8 ((t (:inherit outline-8 :weight bold :height 1.0)))))
