(use-package eterm-256color)
(use-package vterm
    :ensure t)

(setq term-prompt-regexp "^<.*> .* . ")
(setq vterm-kill-buffers-on-exit t)
(setq vterm-copy-exclude-prompt t)
(setq vterm-max-scrollback 12000)
(setq vterm-term-environment-variable "eterm-color")

(custom-set-faces
    '(vterm-color-black ((t (:foreground "#0e1013" :background "#0e1013"))))
    '(vterm-color-red ((t (:foreground "#e55561" :background "#e55561"))))
    '(vterm-color-green ((t (:foreground "#8ebd6b" :background "#8ebd6b"))))
    '(vterm-color-yellow ((t (:foreground "#e2b86b" :background "#e2b86b"))))
    '(vterm-color-blue ((t (:foreground "#4fa6ed" :background "#4fa6ed"))))
    '(vterm-color-magenta ((t (:foreground "#bf68d9" :background "#bf68d9"))))
    '(vterm-color-cyan ((t (:foreground "#48b0bd" :background "#48b0bd"))))
    '(vterm-color-white ((t (:foreground "#a0a8b7" :background "#a0a8b7")))))
