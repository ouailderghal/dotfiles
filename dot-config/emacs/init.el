;; init.el

;; Ensure org-mode is loaded
(require 'org)

;; Load the configuration from an Org file
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit go-mode doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :weight bold :height 1.4))))
 '(org-level-2 ((t (:inherit outline-2 :weight bold :height 1.3))))
 '(org-level-3 ((t (:inherit outline-3 :weight bold :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :weight bold :height 1.1))))
 '(org-level-5 ((t (:inherit outline-5 :weight bold :height 1.05))))
 '(org-level-6 ((t (:inherit outline-6 :weight bold :height 1.0))))
 '(org-level-7 ((t (:inherit outline-7 :weight bold :height 1.0))))
 '(org-level-8 ((t (:inherit outline-8 :weight bold :height 1.0)))))
