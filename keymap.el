;; evil mode & keybindings
;; -------------------------
(setq evil-want-keybinding nil)
(use-package evil)
(use-package evil-collection)
(evil-collection-init)

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
 "w l" 'evil-window-right
 "w h" 'evil-window-left
 "w k" 'evil-window-up
 "w j" 'evil-window-down
 "w <" 'evil-window-decrease-width
 "w >" 'evil-window-increase-width
 "w +" 'evil-window-decrease-height
 "w -" 'evil-window-increase-height
 "w d" 'delete-window
 "w b" 'balance-windows
 "b" '(:ignore t :which-key "buffer")
 "b e" 'eval-buffer
 "b s" 'save-buffer
 "b d" 'kill-this-buffer
 "b i" 'ibuffer
 "o" '(:ignore t :which-key "open")
 "o t" 'term
 "o f" 'find-file
 "o c" '(:ignore t :which-key "config")
 "o c i" '((lambda () (interactive) (find-file (expand-file-name (concat user-emacs-directory "/init.el")))) :which-key "init.el")
 "o c k" '((lambda () (interactive) (find-file (expand-file-name (concat user-emacs-directory "/keymap.el")))) :which-key "keymap.el")
 "o c m" '((lambda () (interactive) (find-file (expand-file-name (concat user-emacs-directory "/modeline.el")))) :which-key "modeline.el")
 "q" '(:ignore t :which-key "session")
 "q q" 'save-buffers-kill-terminal
 "i" '(:ignore t :which-key "insert")
 "i c" 'counsel-colors-emacs
 "t" '(:ignore t :which-key "toggle")
 "p" 'projectile-command-map
 )

(global-evil-leader-mode)
(evil-mode 1)
