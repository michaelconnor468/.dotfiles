(defun mjc/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
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
  (org-bullets-bullet-list '("◉" "●" "○" "○" "○")))

(with-eval-after-load 'org-faces
  (dolist (face '((org-level-1 . 1.4)
       		  (org-level-2 . 1.2)
		  (org-level-3 . 1.0)
	          (org-level-4 . 1.0)
	          (org-level-5 . 1.0)))
    (set-face-attribute (car face) nil :font "Source Code Pro" :weight 'regular :height (cdr face))))

;; Customize - within lists into a dot
(font-lock-add-keywords 'org-mode
			'(("^ *\\([-]\\) "
			   (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(setq org-agenda-files
      '("~/Documents/Orgfiles/todo.org"))
(setq org-agenda-start-with-log-mode t)
(setq org-log-done 'time)
(setq org-log-into-drawer t)

(setq org-enforce-todo-dependencies t)
;; ! for time logging, @ for notes logging
(setq org-todo-keywords
      '((sequence "TODO(t)" "IN PROGRESS(i!)" "|" "DONE(d!)")))
(setq org-todo-keyword-faces
    '(("IN PROGRESS" . "yellow") ("DONE" . "green")))
(setq org-priority-highest 1)
(setq org-priority-default 2)
(setq org-priority-lowest 3)
(defun org-summary-todo (n-done n-not-done)
"Switch entry to DONE when all subentries are done, to TODO otherwise."
(let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook #'org-summary-todo)

(setq org-agenda-custom-commands
      '(("d" "Dashboard"
	 ((agenda "" ((org-deadline-warning-days 7)))
	  (todo "NEXT"
		((org-agenda-overriding-header "Next Tasks")))))))

(setq org-tag-alist
      '((:startgroup)
	(:endgroup)
	("errand" . ?e)
	("home" . ?h)
	("work" . ?w)
	("portfolio" . ?p)))

(setq org-refile-targets
      '(("archive.org" :maxlevel . 1)))
(advice-add 'org-refile :after 'org-save-all-org-buffers)

(setq org-directory "~/Documents/Orgfiles")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-capture-templates
      '(("n" "Notes")
	("nn" "Note" entry (file+olp "~/Documents/Orgfiles/notes.org" "Notes" "* "))
	("t" "Todo")
	("tt" "Todo" entry (file+olp "~/Documents/Orgfiles/todo.org" "Backlog")
	 "* TODO ")
	("ts" "Shopping" checkitem (file+olp "~/Documents/Orgfiles/shopping.org" "Backlog"))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (shell . t)))
(setq org-confirm-babel-evaluate nil)
