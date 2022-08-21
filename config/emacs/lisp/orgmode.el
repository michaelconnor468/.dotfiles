(defun mjc/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1))

(setq org-indent-indentation-per-level 2)

(use-package org
  :hook (org-mode . mjc/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"
	org-hide-emphasis-markers nil))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "●" "○" "○" "○" "○" "○" "○" "○" "○" "○")))

(with-eval-after-load 'org-faces
  (dolist (face '((org-level-1 . 1.3)
       		  (org-level-2 . 1.2)
		  (org-level-3 . 1.1)
	          (org-level-4 . 1.0)
	          (org-level-5 . 1.0)
	          (org-level-6 . 1.0)
	          (org-level-7 . 1.0)
	          (org-level-8 . 1.0)))
    (set-face-attribute (car face) nil :font "Source Code Pro" :weight 'regular :height (cdr face))))

;; Replace list hyphen with dot
(font-lock-add-keywords 'org-mode
			'(("^ *\\([-]\\) "
			   (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; Ensure that anything that should be fixed-pitch in Org files appears that way
(with-eval-after-load 'org-faces
    (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
    (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
    (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
    (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
    (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
    (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(setq org-agenda-files
      '("~/Documents/Orgfiles/todo.org"
	"~/Documents/Orgfiles/habit.org"))
(setq org-agenda-start-with-log-mode t)
(setq org-log-done 'time)
(setq org-log-into-drawer t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")))

(setq org-agenda-custom-commands
      '(("d" "Dashboard"
	 ((agenda "" ((org-deadline-warning-days 7)))
	  (todo "NEXT"
		((org-agenda-overriding-header "Next Tasks")))))))

(setq org-tag-alist
      '((:startgroup)
	; Mututally exclusive tags go here
	(:endgroup)
	("errand" . ?e)
	("home" . ?h)
	("work" . ?w)
	("portfolio" . ?p)))

(setq org-refile-targets
      '(("archive.org" :maxlevel . 1)
	("todo.org" :maxlevel . 1)))
(advice-add 'org-refile :after 'org-save-all-org-buffers)

(setq org-capture-templates
      '(("t" "Tasks / Projects")
	("tt" "Task" entry (file+olp "~/Documents/Orgfiles/todo.org" "Backlog")
	 "* TODO ")))

(require 'org-habit)
(add-to-list 'org-modules 'org-habit)
(setq org-habit-graph-column 60)

(setq org-refile-targets
      '(("Archive.org" :maxlevel . 1)
	("Tasks.org" :maxlevel . 1)))
(advice-add 'org-refile :after 'org-save-all-org-buffers)
