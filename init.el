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

(load-theme 'wombat)

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
   '(zone-rainbow rainbow-mode vterm general counsel ace-window evil-leader which-key undo-fu undo-tree evil-collection evil ivy use-package)))
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

;; evil mode & keybindings
;; -------------------------
(setq evil-want-keybinding nil)
(use-package evil)
(use-package evil-collection)
(evil-collection-init)

(setq evil-normal-state-tag (propertize "[N]" 'face '((:foreground "DarkRed")))
      evil-insert-state-tag (propertize "[I]" 'face '((:foreground "LimeGreen")))
      evil-visual-state-tag (propertize "[V]" 'face '((:foreground "orange")))
      evil-emacs-state-tag (propertize "[E]" 'face '((:foreground "MediumBlue"))))

(use-package evil-leader)
(evil-leader/set-leader "<SPC>")

(use-package general)
(general-define-key
 :keymaps '(normal emacs)
 :prefix "SPC"
 :non-noremal-prefix "M-SPC"
 "w" '(:ignore t :which-key "window")
 "w a" 'ace-window
 "w s" 'split-window-vertically
 "w v" 'split-window-horizontally
 "w d" 'delete-window
 "b" '(:ignore t :which-key "buffer")
 "b e" 'eval-buffer
 "b s" 'save-buffer
 "b d" 'kill-this-buffer
 "o" '(:ignore t :which-key "open")
 "o t" 'term
 "o f" 'find-file
 "o c" '(:ignore t :which-key "config")
 "o c i" '((lambda () (interactive) (find-file (expand-file-name "~/.emacs.d/init.el"))) :which-key "init.el")
 "q" '(:ignore t :which-key "session")
 "q q" 'save-buffers-kill-terminal
 "i" '(:ignore t :which-key "insert")
 "i c" 'counsel-colors-emacs
 "t" '(:ignore t :which-key "toggle")
 )

(global-evil-leader-mode)
(evil-mode 1)

;; Modeline
;; --------------
(defun ml-format--evil ()
  (if (string= (symbol-name evil-state) "normal")
      evil-normal-state-tag
  (if (string= (symbol-name evil-state) "insert")
      evil-insert-state-tag
  (if (string= (symbol-name evil-state) "visual")
      evil-visual-state-tag
  (if (string= (symbol-name evil-state) "emacs")
      evil-emacs-state-tag
    )))
    )
  )

(setq-default mode-line-format
	      (list
	       " %b - %c:%l --- "
	       '(:eval (ml-format--evil))
	       )
	      )
