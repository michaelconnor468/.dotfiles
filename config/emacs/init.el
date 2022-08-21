(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))

;; Keep things clean
(setq package-user-dir "~/.local/share/emacs/packages")
(setq backup-directory-alist `(("." . ,(expand-file-name "~/.cache/emacs/tmp/backups/" user-emacs-directory))))
(make-directory (expand-file-name "~/.cache/emacs/tmp/auto-saves/" user-emacs-directory) t)
(setq auto-save-list-file-prefix (expand-file-name "~/.cache/emacs/tmp/auto-saves/sessions/" user-emacs-directory)
      auto-save-file-name-transforms `((".*" ,(expand-file-name "~/.cache/emacs/tmp/auto-saves/" user-emacs-directory) t)))
(setq create-lockfiles nil)
(setq projectile-known-projects-file (expand-file-name "~/.cache/emacs/tmp/projectile-bookmarks.eld" user-emacs-directory)
      lsp-session-file (expand-file-name "~/.cache/emacs/tmp/.lsp-session-v1" user-emacs-directory))
(setq user-emacs-directory (expand-file-name "~/.cache/emacs"))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'custom-theme-load-path "~/.config/emacs/themes")
(add-to-list 'load-path "~/.config/emacs/lisp")
(load "keybindings.el")
(load "appearance.el")
(load "documentation.el")
(load "autocomplete.el")
(load "projectmanagement.el")
(load "orgmode.el")

(setq backup-directory-alist '(("." . "~/.local/emacs-backups")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" default))
 '(package-selected-packages
   '(atom-one-dark-theme atom-onedark-theme one-dark catppucchin-themes kaolin-themes monokai-theme gruvbox-theme tao-theme abyss-theme catppuccin-theme org-bullets forge evil-magit magit counsel-projectile projectile key-chord hydra evil-collection evil general one-themes helpful counsel ivy-rich which-key rainbow-delimiters swiper ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
