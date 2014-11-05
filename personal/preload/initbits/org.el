(defvar my-export-icalendars-of '("personal.org"))

(defun my-export-icalendar-this-file ()
  "I want to export a particular set of files as icalendars when
they're saved."
  (when (member (buffer-name) my-export-icalendars-of)
      (org-export-icalendar-this-file)))

(add-hook 'org-mode-hook
          '(lambda ()
            (add-hook 'after-save-hook 'my-export-icalendar-this-file nil t)
            ;(local-set-key (kbd "C-c t") 'org-toggle-checkbox)
            ;; For some reason org-mode isn't respecting my global key bindings.
            ;; I wonder why.
            (let ((modifier 'shift))
              (local-set-key (vector (list modifier 'left))  'windmove-left)
              (local-set-key (vector (list modifier 'right)) 'windmove-right)
              (local-set-key (vector (list modifier 'up))    'windmove-up)
              (local-set-key (vector (list modifier 'down))  'windmove-down))
            ))

(fset 'kill-org-html-footer
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217788 19 60 100 105 118 32 105 100 61 34 112 111 115 116 13 1 67108896 134217790 23] 0 "%d")) arg)))

;; C-x (                      start the macro
;; C-x )                      stop the macro
;; C-x e                      call the last macro
;; M-x kmacro-call-macro      call macro by name
;; M-x kmacro-name-last-macro name the last macro
;; C-u M-x insert-kbd-macro   to insert the function
(fset 'kill-org-html-header
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217788 19 60 98 111 100 121 13 5 67108896 134217788 23] 0 "%d")) arg)))

(defun my-fix-org-html ()
  (interactive)
  (kill-org-html-footer)
  (kill-org-html-header))
