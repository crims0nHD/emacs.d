;; Modeline
;; --------------
(setq evil-normal-state-tag (propertize "[N]" 'face '((:background "DarkRed")))
      evil-insert-state-tag (propertize "[I]" 'face '((:background "LimeGreen")))
      evil-visual-state-tag (propertize "[V]" 'face '((:background "orange")))
      evil-emacs-state-tag (propertize "[E]" 'face '((:background "MediumBlue"))))

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
	       "   "
	       '(:eval (ml-format--evil))
	       " %b - %c:%l --- "
	       )
	      )

