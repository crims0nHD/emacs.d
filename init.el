;; My first init.el

;; Messages
; Startup buffer
(setq inhibit-startup-message t)
; Minibuffer
(defun display-startup-echo-area-message ()
  (message ""))
; Scratch buffer
(setq initial-scratch-message "")

(scroll-bar-mode -1) ; Disable Scrollbar
(tool-bar-mode -1) ; Disable toolbar
(tooltip-mode -1) ; Disable tooltips
(set-fringe-mode 0) ; borders
(menu-bar-mode -1)
(setq visible-bell t)

;; Packages
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages")))

;; Init packages
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if unavailable
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; use-package stuff
(require 'use-package)
(setq use-package-always-ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-mode t)
 '(package-selected-packages
   '(projectile powerline doom-themes zone-rainbow rainbow-mode vterm general counsel ace-window evil-leader which-key undo-fu undo-tree evil-collection evil ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Line numbers
(global-display-line-numbers-mode)

;; Ace Window
(use-package ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; ivy & counsel
(use-package ivy)
(use-package counsel)
(counsel-mode 1)

;; which-key
(use-package which-key)
(which-key-mode t)

;; undo
(use-package undo-fu)

;; vterm
(use-package vterm)

;; theme
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-gruvbox t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; Projectile
(use-package projectile)
(setq projectile-project-search-path '("~/src/"))
(projectile-mode +1)

;; Keymap
(load (expand-file-name (concat user-emacs-directory "/keymap.el")))

;; Modeline
(load (expand-file-name (concat user-emacs-directory "/modeline.el")))
