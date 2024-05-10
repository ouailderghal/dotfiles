(setq user-full-name "Ouail Derghal"
       user-mail-address "ouail.derghal@imt-atlantique.fr")

(setq doom-font (font-spec :family "Hack Nerd Font" :size 16 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Hack Nerd Font" :size 18))

(setq doom-theme 'doom-badger)

(use-package doom-modeline
  :custom-face (doom-modeline-buffer-modified ((t (:foreground "orange")))))

(defun od/dired-open-pdf ()
  "Open the selected PDF file in evince."
  (interactive)
  (let ((file (dired-get-file-for-visit)))
    (if (string-match "\\.pdf\\'" file)
        (start-process "evince" nil "evince" file)
      (message "Not a PDF file."))))

(map! :map dired-mode-map
      :localleader
      :desc "Open PDF in Evince" "o" #'od/dired-open-pdf)

(setq org-ellipsis "⤵")
(setq org-directory "~/Dropbox/org/")

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.4))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.3))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.2))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.1))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.1)))))

(use-package org
  :config
  (setq org-capture-templates
        '(("p" "Personal Todo" entry
           (file+headline "~/Dropbox/org/personal.org" "Tasks")
           "* TODO %?\n %i\n")

          ("n" "Personal Note" entry
           (file+headline "~/Dropbox/org/personal.org" "Notes")
           "* %?\n %i\n")))

  (add-to-list 'org-capture-templates
               '("i" "IMT Todo" entry
                 (file+headline "~/Dropbox/org/phd.org" "Tasks")
                 "* TODO %?\n %i\n"))

  (add-to-list 'org-capture-templates
               '("w" "Work Todo" entry
                 (file+headline "~/Dropbox/org/work.org" "Tasks")
                 "* TODO %?\n %i\n")))

(setq display-line-numbers-type t)

(map! :leader
      :desc "Run shell in project" "p $" #'projectile-run-shell)

(defun od/open-alacritty-here ()
  "Open an Alacritty terminal in the current working directory."
  (interactive)
  (let ((default-directory (file-name-directory buffer-file-name)))
    (start-process "alacritty" nil "alacritty")))

(map! :leader
      :desc "Open Alacritty here" "$" #'od/open-alacritty-here)
