;(require 'browse-kill-ring)
;mini-buffer
;(switch-to-buffer 'minibuffer)

;; (defun my-current-buffer()
;;   (interactive)
;;   (message (current-buffer)))
;; (require 'rect-mark)
;; (global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
;; (global-set-key (kbd "C-x r C-x")   'rm-exchange-point-and-mark)
;; (global-set-key (kbd "C-x r C-w")   'rm-kill-region)
;; (global-set-key (kbd "C-x r M-w")   'rm-kill-ring-save)
;; (global-set-key (kbd "C-x r <down-mouse-1>") 'rm-mouse-drag-region)

;(defvar my-rect-insert nil)
;(setq my-rect-insert nil)
;(setq my-rect-insert t)

;; (defadvice rm-mouse-drag-region (around my-drag-region)
;;   (setq my-rect-insert t)
;;   ad-do-it
;;   (setq my-rect-insert nil))
;; (ad-activate 'rm-mouse-drag-region)

;; I'm going to make this work like TextMate's feature.
;; (defadvice self-insert-command (before my-rect-insert (n) activate)
;;   (message "hi %c" n)
;;   (if (and nil my-rect-insert)
;;       (apply-on-rectangle 'string-rectangle-line (region-beginning) (region-end) (format "%c" n) nil)
;;       ;ad-do-it
;;       ))

;(ad-activate 'self-insert-command t)
;(ad-deactivate 'self-insert-command)


(defun my-testing ()
  (interactive)
  (message "hi")
  ;(message "k = %c" k)
  )

(defadvice my-testing (around my-testing-advice)
  (message "advice")
  ad-do-it)
(ad-activate 'my-testing)
(ad-deactivate 'my-testing)


;; I can't just take over self-insert-command.  Here's the documentation.
;; http://www.gnu.org/software/emacs/elisp-manual/html_node/Keymaps-and-Minor-Modes.html
(defvar my-buffer nil)
(defvar my-touched nil)
(defvar my-begin nil)
(defvar my-end nil)
(defun my-completion (string pred flag)
  ;(message "got %s" word)
  (with-current-buffer my-buffer
    (when my-touched
      (undo))
    (apply-on-rectangle 'string-rectangle-line my-begin
                        my-end string nil)
    (setf my-touched t)))

(defun what-region ()
  (interactive)
  (let ((begin (region-beginning))
        (end (region-end)))
    (message "region (%d %d)" begin end)))

(defun my-test ()
  (interactive)
  (let ((begin (region-beginning))
        (end (region-end)))
    (apply-on-rectangle 'string-rectangle-line 
                        begin end "1" nil)
    (apply-on-rectangle 'string-rectangle-line 
                        (+ begin 1) end "2" nil)
    (apply-on-rectangle 'string-rectangle-line 
                        (+ begin 3) end "3" nil)
    ))

(defvar my-keymap nil)
(defvar my-count 0)

(setf my-count 0)
(defun start-weird-edit ()
  (interactive)
  (setf my-keymap (or (current-local-map) (make-sparse-keymap)))
  (let ((map (copy-keymap my-keymap)))
    (define-key map [remap self-insert-command] 'my-self-insert-command)
    (use-local-map map)
    ))
(defun stop-weird-edit ()
  (interactive)
  (when my-keymap
    (use-local-map my-keymap)
    (setf my-keymap nil)))

(defun my-self-insert-command (n)
  (interactive "p")
  (let (c)
    (save-excursion
      (self-insert-command n)
      (setf c (char-before))
      (message "it's me! %c" c)
      (backward-delete-char n)
     )
    (apply-on-rectangle 'string-rectangle-line (+ (region-beginning) my-count) (region-end) (format "%c" c) nil)
    (incf my-count)
    ;(forward-char)
    ;(forward-char-mark n)
   )
  )

;; http://emacspeak.blogspot.com/2007/03/emacs-client-for-google-services.html
;; (add-to-list 'load-path "~/.emacs.d/g-client")
;; (require 'g)

;; (add-to-list 'load-path "~/.emacs.d/nxml-mode")
;; (require 'nxml-mode)

;; (add-to-list 'load-path "~/.emacs.d/weblogger")
;; (require 'weblogger)

;; (add-to-list 'load-path "~/.emacs.d/e-blog/")
;; (require 'e-blog)

;; (add-to-list 'load-path "~/.emacs.d/emacs-w3m")
;; (require 'w3m-load)

;; gblogger seems a litle weak.
;(setq g-html-handler 'w3m-buffer)

(defun j-complete2 (string)
  (let* ((dirs (j-filter (lambda (dir) (string-match (concat ".*" string ".*") dir)) j-dirs)))
    dirs))

;(load-library "~/j/j.el")

;(global-set-key (kbd "C-c j") 'j)

;(add-to-list 'load-path "~/.emacs.d/git-emacs")
;(require 'git-emacs)

(defun my-point-minmax ()
  (interactive)
  (message "(%d %d)" (point-min) (point-max)))


;; M-x ielm provides a great elisp REPL, much better than working
;; directly with scratch.
(defun my-test (a &optional b)
  (list a b))

(defun my-point ()
  (interactive)
  (message "point %d" (point)))

(defun list-overlays-at (&optional pos)
      "Describe overlays at POS or point."
      (interactive)
      (setq pos (or pos (point)))
      (let ((overlays (overlays-at pos))
            (obuf (current-buffer))
            (buf (get-buffer-create "*Overlays*"))
            (props '(priority window category face mouse-face display
                     help-echo modification-hooks insert-in-front-hooks
                     insert-behind-hooks invisible intangible
                     isearch-open-invisible isearch-open-invisible-temporary
                     before-string after-string evaporate local-map keymap
                     field))
            start end text)
        (if (not overlays)
            (message "None.")
          (set-buffer buf)
          (erase-buffer)
          (dolist (o overlays)
            (setq start (overlay-start o)
                  end (overlay-end o)
                  text (with-current-buffer obuf
                         (buffer-substring start end)))
            (when (> (- end start) 13)
              (setq text (concat (substring text 1 10) "...")))
            (insert (format "From %d to %d: \"%s\":\n" start end text))
            (dolist (p props)
              (when (overlay-get o p)
                (insert (format " %15S: %S\n" p (overlay-get o p))))))
          (pop-to-buffer buf))))

(defun count-chars (begin end)
  (interactive "r")
  (count-matches "." begin end t))

(global-set-key (kbd "C-c M-c") 'count-chars)


;(require 'org-export-latex)
;; (require 'redshank-loader
;;          "~/.emacs.d/redshank/redshank-loader")

;; (eval-after-load "redshank-loader"
;;   `(redshank-setup '(lisp-mode-hook
;;                      slime-repl-mode-hook) t))

