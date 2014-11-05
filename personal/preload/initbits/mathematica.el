

(fset 'kill-array-headers
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\274\276\274\\end" 0 "%d")) arg)))

(defun paste-mathematica-table()
  (interactive)
  (let ((b (current-buffer)))
  (save-excursion
    ;(with-temp-buffer
      (switch-to-buffer "debug")
      (progn
      (kill-region (point-min) (point-max))
      (yank)
      (goto-char (point-min))
      (fix-mathematica-table)
      (kill-new "")
      (copy-region-as-kill (point-min) (point-max))))
  (switch-to-buffer b)
  (yank)
  ))

(defun fix-mathematica-table ()
  "This assumes that you only have the table in the buffer.  So
it is dangerous to use anywhere else."
  (interactive)
  (replace-regexp "\\\\text{\\([^`]\\{0,8\\}\\)[^`]*`}" "\\1" 
                  nil (point-min) (point-max))
  (replace-regexp " \\\\$" ""
                  nil (point-min) (point-max))
  (replace-regexp "^\\\\.*$" ""
                  nil (point-min) (point-max))
;;   (goto-char (point-min))
;;   (search-forward-regexp "\\\\left" (point-max) t)
;;   (if (= (point-min) (match-beginning 0))
;;       (kill-array-headers))
  )

;; (require 'mathematica)

;; (define-key mathematica-mode-map (kbd "<S-return>") 
;;   (lambda () (interactive) (mathematica-execute 2)))

;; (define-key mathematica-mode-map (kbd "C-c C-j") 
;;   (lambda () (interactive) 
;;           (setq mathematica-show-message-only 1)
;;           (mathematica-execute nil)))
