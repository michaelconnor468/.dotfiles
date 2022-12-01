(when (eq system-type 'darwin)
  (setq insert-directory-program "/opt/homebrew/bin/gls"))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-agho --group-directories-first"))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-up-directory
    "l" 'dired-find-file))

(use-package dired-single)

;; Requires all-the-icons package to be installed
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-open
  :config
  (setq dired-open-extensions '(("png" . "sxiv")
				("jpg" . "sxiv")
				("mkv" . "mpv"))))

(use-package find-file-in-project
  :config
  (defun ffip-diff-mode-hook-setup ()
    (evil-local-set-key 'normal "K" 'diff-hunk-prev)
    (evil-local-set-key 'normal "J" 'diff-hunk-next)
    (evil-local-set-key 'normal "P" 'diff-file-prev)
    (evil-local-set-key 'normal "N" 'diff-file-next)
    (evil-local-set-key 'normal (kbd "RET") 'ffip-diff-find-file)
    (evil-local-set-key 'normal "o" 'ffip-diff-find-file))
    (add-hook 'ffip-diff-mode-hook 'ffip-diff-mode-hook-setup))
