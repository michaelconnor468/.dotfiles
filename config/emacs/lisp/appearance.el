(require 'all-the-icons)

(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-fringe-mode -1)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(load-theme 'one-dark t)

(set-face-attribute 'default nil :font "Source Code Pro" :height 100 :inherit 'fixed-pitch)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
