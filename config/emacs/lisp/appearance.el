(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-fringe-mode -1)
(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers 'relative)

(set-face-attribute 'default nil :font "Source Code Pro" :height 120)

(use-package one-themes
  :init
  (load-theme 'one-dark t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
