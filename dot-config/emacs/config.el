(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)
(set-face-attribute 'default nil
		    :font "ZedMono Nerd Font Mono"
		    :height 130)

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-ir-black t))

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; Enable org-indent-mode for better alignment under bullet points
(add-hook 'org-mode-hook 'org-indent-mode)

;; Optionally, customize indentation settings
(setq org-startup-indented t)
(setq org-adapt-indentation nil)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.1))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.05))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))

(use-package org
  :hook (org-mode . visual-line-mode))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter)

(use-package eglot
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'eglot-ensure)
  (add-to-list 'eglot-server-programs
	       '(go-mode . ("gopls")))
  (add-to-list 'eglot-server-programs
	       '(ocaml-mode . ("ocamllsp")))
  (add-to-list 'eglot-server-programs
	       '(dockerfile-mode . ("docker-langserver" "--stdio"))))

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package company
  :hook (prog-mode . company-mode)
  :config

  (defun disable-company-mode-in-shell ()
    (company-mode -1))

  (add-hook 'shell-mode-hook 'disable-company-mode-in-shell)
  (add-hook 'eshell-mode-hook 'disable-company-mode-in-shell)

  (setq company-idle-delay 0
        company-minimum-prefix-length 1
        company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-show-numbers t))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(setq eshell-aliases-file "~/.bash_aliases")

(use-package eshell
  :config
  (eshell)
  (eshell-read-aliases-list))

(use-package tuareg
  :ensure t
  :mode ("\\.ml\\'" . tuareg-mode)
  :hook (tuareg-mode . eglot-ensure))

(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode))

(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile\\'"
  :hook (dockerfile-mode . eglot-ensure))

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" "\\.markdown\\'")
  :hook (markdown-mode . (lambda () (setq markdown-command "pandoc"))))

(use-package yaml-mode
    :ensure t
    :mode ("\\.yml\\'" "\\.yaml\\'")
    :hook (yaml-mode . (lambda () (setq yaml-indent-offset 2))))

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :ensure t
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))
