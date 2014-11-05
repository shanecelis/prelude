;; slime.el

(setq inferior-lisp-program          "sbcl"
      lisp-indent-function           'common-lisp-indent-function
;      slime-complete-symbol-function 'slime-complete-symbol
      common-lisp-hyperspect-root    "http://www.lispworks.com/documentation/HyperSpec/"
      slime-startup-animation nil)



;; Redo core file by running:
;; $ sbcl bootstrap.lisp; # in ~/lib/sbcl
;; (setq slime-lisp-implementations
;;       `((sbcl ("sbcl" ;"--core" ,(expand-file-name "~/lib/sbcl/sbcl.core-with-slime")
;; ;               "--dynamic-space-size" "2000"
;; )
;;          :init (lambda (port-file _) (format
;;                   "(swank:start-server %S :coding-system \"utf-8-unix\")\n"
;;                   port-file))
;;          :coding-system utf-8-unix)
;;         (clojure ("~/bin/clojure") :init clojure-init 
;;          :coding-system utf-8-unix)
;;         ))


;; (require 'clojure-mode)

;; (setq swank-clojure-jar-path "~/clojure/clojure/clojure.jar"
;;       swank-clojure-extra-classpaths (list
;; 				      "~/clojure/swank-clojure/src/main/clojure"
;; 				      "~/clojure/clojure-contrib/clojure-contrib.jar"))
;; (require 'swank-clojure-autoload)

;; (autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)

;;(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

    (defun my-slime-repl-opening-paren ()
      "Add an opening paren if there isn't one in the REPL already."
      (interactive)
      (save-excursion
        (goto-char slime-repl-input-start-mark)
        (unless (eq (char-after) (string-to-char "("))
          (insert "("))))

    (defun my-slime-repl-opening-closing-return ()
      "Add an opening paren if there isn't one, and close any open lists, then return."
      (interactive)
      (my-slime-repl-opening-paren)
      (slime-repl-closing-return))

(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))


    (define-key slime-repl-mode-map (kbd "<C-return>") 'my-slime-repl-opening-closing-return)



))

;(clojure-slime-config "/Users/shane/clojure")


;(setq slime-default-lisp 'sbcl)
(setq slime-default-lisp 'clisp)
;(setq slime-default-lisp 'clojure)

(require 'slime)
;; (slime-setup '(slime-fancy slime-asdf slime-fuzzy 
;;                slime-autodoc
;;                ; This was a backtrace I wrote for myself because I
;;                ; wanted to see something different than what I got
;;                ; from slime.
;;                                         ; slime-alt-backtrace 
;;                ))


;; looks at (cl:machine-instance)
;(push (slime-create-filename-translator :machine-instance "windowmini.*"
;                                        :remote-host "192.168.1.104"
;                                        :username "Shane")
;      slime-filename-translations)

;(add-hook 'slime-mode-hook (lambda () (slime-autodoc-mode t)))

(defun slime-windowmini ()
  (interactive)
  (slime-connect "windowmini" "4005"))

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

;; From Bill Clementson's blog.
;; http://bc.tech.coop/blog/070425.html
(defun slime-new-repl (&optional new-port)
  "Create additional REPL for the current Lisp connection."
  (interactive)
  (if (slime-current-connection)
      (let ((port (or new-port (slime-connection-port (slime-connection)))))
	(slime-eval `(swank::create-server :port ,port))
	(slime-connect slime-lisp-host port))
    (error "Not connected")))

;; http://bc.tech.coop/blog/070424.html
(defun slime-send-dwim (arg)
  "Send the appropriate forms to CL to be evaluated."
  (interactive "P")
  (save-excursion
    (cond 
      ;;Region selected - evaluate region
      ((not (equal mark-active nil))
       (copy-region-as-kill-nomark (mark) (point)))
      ;; At/before sexp - evaluate next sexp
      ((or (looking-at "\s(")
	   (save-excursion
	     (ignore-errors (forward-char 1))
	     (looking-at "\s(")))
       (forward-list 1)
       (let ((end (point))
	     (beg (save-excursion
		    (backward-list 1)
		    (point))))
	 (copy-region-as-kill-nomark beg end)))
      ;; At/after sexp - evaluate last sexp
      ((or (looking-at "\s)")
	   (save-excursion
	     (backward-char 1)
	     (looking-at "\s)")))
       (if (looking-at "\s)")
	   (forward-char 1))
       (let ((end (point))
	     (beg (save-excursion
		    (backward-list 1)
		    (point))))
	 (copy-region-as-kill-nomark beg end)))
      ;; Default - evaluate enclosing top-level sexp
      (t (progn
	   (while (ignore-errors (progn
				   (backward-up-list)
				   t)))
	   (forward-list 1)
	   (let ((end (point))
		 (beg (save-excursion
			(backward-list 1)
			(point))))
	     (copy-region-as-kill-nomark beg end)))))
    (set-buffer (slime-output-buffer))
    (unless (eq (current-buffer) (window-buffer))
      (pop-to-buffer (current-buffer) t))
    (goto-char (point-max))
    (yank)
    (if arg (progn
	      (slime-repl-return)
	      (other-window 1)))))

(defun slime-run-tests ()
  (interactive)
    (save-excursion
      (set-buffer (slime-output-buffer))
      (unless (eq (current-buffer) (window-buffer))
        (pop-to-buffer (current-buffer) t))
      ;(switch-to-buffer (slime-output-buffer))
      (slime-repl-kill-input)
      (goto-char (point-max))
      (insert "(run-tests)")
      (slime-repl-return)))

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;(when
;	(load
;	 (expand-file-name "~/.emacs.d/elpa/package.el"))
;  (package-initialize))

;(require 'paredit)

;(define-key slime-mode-map (kbd "(") 'paredit-open-parenthesis)
;(define-key slime-mode-map (kbd ")") 'paredit-close-parenthesis)

;(define-key slime-mode-map (kbd "\"") 'paredit-doublequote)
;(define-key slime-mode-map (kbd "\\") 'paredit-backslash)

;(define-key slime-mode-map (kbd "RET") 'paredit-newline)
;(define-key slime-mode-map (kbd "<return>") 'paredit-newline)

; C-c < slime-list-callers
; C-c > slime-list-callees
; C-c Return slime-macroexpand-1
; C-M-f forward-sexp
(defun transpose-sexps-up ()
  (interactive)
  (transpose-sexps -1))

