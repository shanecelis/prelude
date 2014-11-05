;; old.emacs.el
;; 
;; Shane Celis
;;

;(toggle-debug-on-error t)

;; Load Path
;; =========



(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'winner-mode) (winner-mode 1))


;; Set and Set Default
;; ===================

(setq require-final-newline t      ; Always end a file with a newline
      indent-tabs-mode nil         ; No more tabs (not cross platform)
      tab-default-width 4
      c-basic-offset 4
      c-brace-offset -2
      inhibit-startup-message t
      password-cache-expiry 7200
      remember-annotation-functions '(org-remember-annotation)
      remember-handler-functions '(org-remember-handler)
      org-remember-templates '((116 "* TODO %?\n  %u" "~/todo.org" "Tasks") (110 "* %u %?" "~/notes.org" "Notes"))
      html-helper-build-new-buffer nil
      bm-highlight-style 'bm-highlight-only-fringe
      cua-enable-cua-keys nil
      ido-execute-command-cache nil
      scheme-program-name "gsi -:d-"
      wdired-allow-to-change-permissions 'advanced
      ;;source-directory "~/.emacs.d/20090111/src"
      ido-enable-flex-matching t
)

;; Requires
;; ========
;(require scheme-mode)

;; Key bindings
;; ============

; C-x tab to shift region to the right, rigidly.
(global-set-key (kbd "C-x <S-tab>") (lambda (start end)
                                      (interactive "r")
                                      (indent-rigidly start end (- c-basic-offset))
                                      (exchange-point-and-mark)
                                      (exchange-point-and-mark))
                )
(global-set-key (kbd "C-x <tab>") (lambda (start end)
                                      (interactive "r")
                                      (indent-rigidly start end c-basic-offset)
                                      (exchange-point-and-mark)
                                      (exchange-point-and-mark))
                )
;  (global-set-key (kbd "A-t") 'shell)
;  (global-set-key (kbd "A-u") 'digit-argument)
(global-set-key (kbd "<A-return>") 'toggle-frame-fullscreen)
(global-set-key (kbd "A-e") 'kmacro-end-and-call-macro)
(global-set-key (kbd "A-z") 'undo)
(global-set-key (kbd "A-b") 'compile) ; Think build.
(global-set-key (kbd "<f1>") 'slime-selector)
(global-set-key (kbd "A-r") 'slime-repl)
(global-set-key (kbd "A-t") 'slime-run-tests)
(global-set-key (kbd "C-M-t") 'transpose-sexps)
(global-set-key (kbd "C-t") 'transpose-sexps-up)
(global-set-key (kbd "<f5>") 'my-htmlize-region)
(global-set-key (kbd "C-c r") 'org-remember)
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c #") 'comment-region)
(global-set-key (kbd "C-c l") 'compile)
(global-set-key (kbd "C-c C-l") 'recompile)
(global-set-key (kbd "C-c C-r") 'comment-region)
;; Make the `q' key bury the current buffer when viewing help and
;; other things.
;; (define-key view-mode-map "q" 'bury-buffer) ;XXX turned off for Emacs full screen
;; (define-key help-mode-map "q" 'bury-buffer)
;(define-key view-mode-map "q" 'bury-buffer) ;XXX turned off for Emacs full screen
(define-key help-map "q" 'bury-buffer)
;(define-key nuweb-mode-map (kbd "C-c C-l") 'recompile)
;; (define-key scheme-mode-map (kbd "C-c C-b") 'scheme-send-buffer)
;; (define-key scheme-mode-map (kbd "C-c u u") 'scheme-run-unit-tests)
;; (define-key scheme-mode-map (kbd "C-c u r") 'scheme-reset-unit-tests)
;(add-hook 'inferior-scheme-mode-hook (function gambit-inferior-mode)) 

(define-key completion-list-mode-map "q" 'bury-buffer)

;(global-set-key "\C-cs" 'flyspell-mode)
(global-set-key "\C-g" 'keyboard-quit)
;(global-set-key (kbd "C-c C-g") 'minibuffer-keyboard-quit)
(global-set-key (kbd "C-c C-g") 'minibuffer-quit)
;(global-set-key (kbd "C-c C-g") 'exit-minibuffer)
(global-set-key (kbd "<M-down-mouse-1>") 'cua-mouse-set-rectangle-mark)

;; These need to be rethought.
(global-set-key (kbd "A-[") 'shrink-window-horizontally)
(global-set-key (kbd "A-]") 'enlarge-window-horizontally)
(global-set-key (kbd "A-{") 'shrink-window)
(global-set-key (kbd "A-}") 'enlarge-window)

(global-set-key (kbd "C-c p") 'customize-group) ; p for preferences  
;(global-set-key (kbd "C-c /") 'anything)
;; This one was a little scary.
;;(global-set-key "\M-x" 'ido-execute-command)
;;(global-set-key "\M-x" 'execute-extended-command)

; (global-set-key (kbd "<A-S-right>") 'cycle-buffer-backward)
; (global-set-key (kbd "<A-S-left>")  'cycle-buffer)
; (global-set-key (kbd "<A-right>")   'cycle-buffer-backward-permissive)
; (global-set-key (kbd "<A-left>")    'cycle-buffer-permissive)

;; Awesome these are exactly what I've been waiting for!  woot!
(windmove-default-keybindings)

(global-set-key (kbd "A-w") 'kill-buffer)

;; Let me manage my clipboard myself.
;(setq x-select-enable-clipboard t)
(global-set-key (kbd "A-v") 'clipboard-yank)
(global-set-key (kbd "A-c") 'clipboard-kill-ring-save)
(global-set-key (kbd "A-x") 'clipboard-kill-region)

;(global-set-key (kbd "C-w") 'my-kill-region)
;; Vim-ish keybindings.
(global-set-key (kbd "A-j") 'next-line)
(global-set-key (kbd "A-k") 'previous-line)
(global-set-key (kbd "A-h") 'backward-char)
(global-set-key (kbd "A-l") 'forward-char)

(global-set-key "\C-ch" 'hs-org/minor-mode)
(global-set-key (kbd "A-a") 'mark-whole-buffer)
(global-set-key "\C-cw" 'count-words-region)
(global-set-key (kbd "A-m")  'bury-buffer)    ; kind of like minimizing a buffer
;(global-set-key "\C-ct" 'twitter-status-edit)
(global-set-key "\C-cg" 'magit-status)
(global-set-key "\C-cy" 'yas/minor-mode)
(global-set-key "\C-xrw" 'copy-rectangle-as-kill)


(define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)
(define-key compilation-mode-map "q" 'bury-buffer)
(global-set-key (kbd "C-c d") 'toggle-current-window-dedication)
;(global-set-key (kbd "C-c i") 'my-auto-install)
(global-set-key (kbd "C-x C-o") 'other-window)
;(global-set-key (kbd "C-c i") 'auto-install-from-emacswiki)
;(global-set-key (kbd "C-c i") 'anything-auto-install-from-emacswiki)

(global-set-key (kbd "C-o") (lambda () (interactive) 
                                    (other-window 1 nil)))
(global-set-key (kbd "A-0") (lambda () (interactive) 
                                    (other-window-from-top 0)))
(global-set-key (kbd "A-1") (lambda () (interactive) 
                                    (other-window-from-top 1)))
(global-set-key (kbd "A-2") (lambda () (interactive) 
                                    (other-window-from-top 2)))
(global-set-key (kbd "A-3") (lambda () (interactive) 
                                    (other-window-from-top 3)))
(global-set-key (kbd "A-4") (lambda () (interactive) 
                                    (other-window-from-top 4)))
(global-set-key (kbd "A-5") (lambda () (interactive) 
                                    (other-window-from-top 5)))
;(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)  


(global-set-key [(control ?.)] 'goto-last-change)
(global-set-key [(control ?,)] 'goto-last-change-reverse)

;(global-set-key (kbd "M-/") 'hippie-expand)
;(global-set-key (kbd "M-i") 'back-to-indentation)
;(global-set-key (kbd "M-m") 'iy-go-to-char)
(global-set-key (kbd "C-/") 'comment-region)
;(global-set-key (kbd "C-0") 'ace-jump-mode)
;(global-set-key (kbd "C-@") 'expand-region)


;; Add Hooks
;; =========

(add-hook 'buffer-menu-mode-hook 
          (lambda ()
            (local-set-key (kbd "C-o") (lambda () (interactive) 
                                               (other-window 1 nil)))))
(add-hook 'occur-mode-hook 
          (lambda ()
            (local-set-key (kbd "C-o") (lambda () (interactive) 
                                               (other-window 1 nil)))))
(add-hook 'shell-mode-hook (lambda ()
                             (ansi-color-for-comint-mode-on)
                             (setq tab-width 8)
                             ;; Swap the keys so that the shell behaves the same as a regular shell
                             (local-set-key  (kbd "<C-up>") 'previous-line-nomark)
                             (local-set-key  (kbd "<C-down>") 'next-line-nomark)
                             (local-set-key  (kbd "<up>") 'comint-previous-input)
                             (local-set-key  (kbd "<down>") 'comint-next-input)
                             ))


(defun scheme-add-unit-test-keys ()
  (local-set-key (kbd "C-c u u") 'scheme-run-unit-tests)
  (local-set-key (kbd "C-c u r") 'scheme-reset-unit-tests)
  )
(add-hook 'inferior-scheme-mode-hook 'scheme-add-unit-test-keys) 
(add-hook 'scheme-mode-hook 'scheme-add-unit-test-keys)
; (function gambit-inferior-mode)
(add-hook 'c-mode-hook (lambda ()
                         (setq tab-width 4)))
(add-hook 'c-mode-common-hook (lambda ()
                                (font-lock-add-keywords nil
                                                        '(("\\<\\(FIXME\\|TODO\\|BUG\\|XXX\\):" 1
                                                           font-lock-warning-face t)))
                                (local-set-key (kbd "C-c o") 'ff-find-other-file)
                                (local-set-key (kbd "C-c l") 'compile)
                                (local-set-key (kbd "C-c C-l") 'recompile)
                                ))

(add-hook 'tex-mode-hook (lambda ()
                                (local-set-key (kbd "C-c l") 'compile)
                                (local-set-key (kbd "C-c C-l") 'recompile)
                                ))

(add-hook 'dired-mode-hook (lambda ()
                                (local-set-key (kbd "C-o") 'other-window)
                                ))

(add-hook 'lisp-interaction-mode-hook (lambda() 
                                        (local-set-key  (kbd "C-c C-j") 'eval-last-sexp)
                                        (local-set-key  (kbd "C-c C-c") 'eval-defun)
                                        (local-set-key  (kbd "M-j") 'macroexpand-last-sexp)
                                        ))

(add-hook 'picture-mode-hook (lambda() (local-set-key  (kbd "<down-mouse-3>") 'artist-mouse-choose-operation)))
(add-hook 'org-mode-hook (lambda() 
                           (local-set-key  (kbd "C-c C-x C-u") 'org-clock-update-time-maybe)
                           ))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
;(add-hook 'twitter-status-edit-mode-hook 'flyspell-mode)
(add-hook 'html-helper-mode-hook 'yas/minor-mode)
(add-hook 'lua-mode-hook 'yas/minor-mode)
;(add-hook 'twitter-status-edit-mode-hook 'longlines-mode)
;(add-hook 'inferior-scheme-mode-hook (function gambit-inferior-mode)) 
;(add-hook 'scheme-mode-hook (function gambit-mode))

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'doc-view-mode-hook 
          (lambda()
            (auto-revert-mode)
            (local-set-key (kbd "C-v") 'doc-view-scroll-up-or-next-page)
            (local-set-key (kbd "M-v") 'doc-view-scroll-down-or-previous-page)))

(add-hook 'emacs-lisp-mode-hook
	    (lambda ()
	      (paredit-mode t)
	      (turn-on-eldoc-mode)
	      (eldoc-add-command
	       'paredit-backward-delete
	       'paredit-close-round)
	      (local-set-key (kbd "RET") 'electrify-return-if-match)
	      (eldoc-add-command 'electrify-return-if-match)
	      (show-paren-mode t)))

(autoload 'scheme-get-current-symbol-info "scheme-complete" nil t)
(add-hook 'scheme-mode-hook
	    (lambda ()
	      (enable-paredit-mode)
        (make-local-variable 'eldoc-documentation-function)
        (setq eldoc-documentation-function 'scheme-get-current-symbol-info)
	      (turn-on-eldoc-mode)
	      (eldoc-add-command
	       'paredit-backward-delete
	       'paredit-close-round)
	      (show-paren-mode t)
        (turn-on-geiser-mode)
        (local-set-key (kbd "TAB") 'indent-for-tab-command)
        (local-set-key (kbd "C-c C-l") 'recompile)
        (local-set-key (kbd "RET") 'electrify-return-if-match)
        (eldoc-add-command 'electrify-return-if-match)))

(eval-after-load 'scheme
  '(define-key scheme-mode-map "\t" 'scheme-complete-or-indent))

(eval-after-load 'paredit
  '(progn
    (define-key paredit-mode-map (kbd "\\") 'self-insert-command)
    (add-to-list 
     'paredit-space-for-delimiter-predicates (lambda (endp delimiter)
                                               (not (equal (char-syntax (char-before)) ?\#)))))) 

(eval-after-load 'geiser-mode
  '(progn (define-key geiser-mode-map (kbd "C-c C-e") 'geiser-eval-definition)
    (define-key geiser-mode-map (kbd "C-.") nil)))


;; Color Scheme
;; ============

(defvar after-make-console-frame-hooks '()
"Hooks to run after creating a new TTY frame")
(defvar after-make-window-system-frame-hooks '()
"Hooks to run after creating a new window-system frame")

(defun run-after-make-frame-hooks (frame)
  "Selectively run either `after-make-console-frame-hooks' or
`after-make-window-system-frame-hooks'"
  (select-frame frame)
  (run-hooks (if window-system
                 'after-make-window-system-frame-hooks
                 'after-make-console-frame-hooks)))

(add-hook 'after-make-frame-functions 'run-after-make-frame-hooks)
(add-hook 'after-init-hook
          (lambda ()
            (run-after-make-frame-hooks (selected-frame))))

(set-variable 'color-theme-is-global nil)
;; (add-hook 'after-make-window-system-frame-hooks 
;;           (lambda ()
;;             (load-theme 'pastels-on-dark-custom)))
;(add-hook 'after-make-console-frame-hooks 'color-theme-emacs-nw)

; 'window-system' is nil for a character-based terminal, 'x' for X11, 'mac' for mac, etc.

; If my color-theme won't work, then use midnight. 

(defun unique (lst)
  (and lst 
       (cons (car lst) 
             (unique (remove-if (lambda (x) (eq (car lst) x)) (cdr lst))))))

(defun repl ()
  (interactive)
  (ielm))

;; http://www.emacswiki.org/emacs/IncrementNumber
(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(defvar my-increment-default 1)
;(defvar my-increment-
(defun my-increment-number-decimal (&optional arg)
  "Increment the number forward from point by 'arg'."
  (interactive "p*")
  (let ((p (point))
        field-width-diff)
    (save-excursion
      (save-match-data
        (let (inc-by field-width answer skipped)
          (setq inc-by (if arg arg my-increment-default))
          (setq skipped (+ (skip-chars-backward "-0123456789")))
          (when (re-search-forward "[-0-9]+" (+ p 1) t)
            (setq field-width (- (match-end 0) (match-beginning 0)))
            (setq answer (+ (string-to-number (match-string 0) 10) inc-by))
            ;; (when (< answer 0)
            ;;   (setq answer (+ (expt 10 field-width) answer)))
            (let ((replacement (format (concat "%0" (int-to-string field-width) "d")
                                   answer)))
             (replace-match replacement )
             (setq field-width-diff (- field-width (- (point) (match-beginning 0))))
             )))))
    (goto-char (- p field-width-diff))))

(defun my-decrement-number-decimal (&optional arg)
  (interactive "p*")
  (my-increment-number-decimal (if arg (- arg) (- my-increment-default))))

(global-set-key (kbd "C-=") 'my-increment-number-decimal)
(global-set-key (kbd "C--") 'my-decrement-number-decimal)

(global-set-key (kbd "C-=") '(lambda () (interactive) 
                              (my-increment-number-decimal)
                              (geiser-eval-definition)))

(global-set-key (kbd "C--") '(lambda () (interactive) 
                              (my-decrement-number-decimal)
                              (geiser-eval-definition)))

;(global-set-key (kbd "C-=") 'evil-numbers/inc-at-pt)
;(global-set-key (kbd "C--") 'evil-numbers/dec-at-pt)
; 008.05
;; Don't really need this now that I know about ansi-term.
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;(autoload 'magit-status "magit" nil t)

(setenv "TERM" "xterm-color")

(setenv "VIEW_PDF" "preview -r Emacs")

;(setenv "DYLD_LIBRARY_PATH" "/opt/local/lib:")
(setenv "DYLD_FALLBACK_LIBRARY_PATH" "/opt/local/lib:")

; Set the same PATH that your shell normally has.
(setenv "PATH" (shell-command-to-string "bash -i -c 'echo -n $PATH'"))

; What's the path to activate tramp? /ssh:user@host:path/to/file.txt
; To do a tunnel
; ssh -L4005:127.0.0.1:4005 Shane@192.168.1.104

;(add-to-list 'tramp-default-user-alist
;             '("ssh"  ".*windowmini.*" "Shane"))
(paren-activate)
;(setf paren-priority 'close)

;; Helper for compilation. Close the compilation window if
;; there was no error at all.
;; (defun compilation-exit-autoclose (status code msg)
;;   ;; If M-x compile exists with a 0
;;   (when (and (eq status 'exit) (zerop code))
;;     ;; then bury the *compilation* buffer, so that C-x b doesn't go there
;;     (bury-buffer)
;;     ;; and delete the *compilation* window
;;     (delete-window (get-buffer-window (get-buffer "*compilation*"))))
;;   ;; Always return the anticipated result of compilation-exit-message-function
;;   (cons msg code))
;; ;; Specify my function (maybe I should have done a lambda function)
;; (setq compilation-exit-message-function 'compilation-exit-autoclose)


;; (setq compilation-finish-functions 'compile-autoclose)
;; (defun compile-autoclose (buffer string)
;;   (cond ((string-match "finished" string)
;;          (bury-buffer "*compilation*")
;;          (winner-undo)
;;          (message "Build successful."))
;;         (t                                                                    
;;          (message "Compilation exited abnormally: %s" string))))


;; --------------------
;; -- Lazy autoloads --
;; --------------------

(defun autoload-mode (name regex &optional file)
  ;; Copyright (c) 2007-2008 Nathan Weizenbaum
  "Automatically loads a language mode
when opening a file of the appropriate type.

`name' is the name of the mode.
E.g. for javascript-mode, `name' would be \"javascript\".

`regex' is the regular expression matching filenames of the appropriate type.

`file' is the name of the file
from which the mode function should be loaded.
By default, it's `name'-mode.el."
  (let* ((name-mode (concat name "-mode"))
         (name-sym (intern name-mode)))
    (autoload name-sym (or file name-mode)
      (format "Major mode for editing %s." name) t)
    (add-to-list 'auto-mode-alist (cons regex name-sym))))

;(autoload-mode "html-helper"      "\\.html$")
(autoload-mode "clojure"          "\\.clj$")
(autoload-mode "noweb"          "\\.nw")
(autoload-mode "lisp-interaction" "\\.emacs$")
(autoload-mode "tex" "\\.tex$")
(autoload-mode "visual-basic" "\\.\\(vb\\|frm\\|bas\\|cls\\)$")

(autoload 'mma-mode "mma.el" "Mathematica package file mode" t)
;(autoload-mode "mathematica" "\\.m$")
(autoload-mode "matlab" "\\.m$")

(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG\\'" . commit-modette))
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.w$" . nuweb-mode))

(defun commit-modette ()
  "A little 'mode' for doing commits via emacsclient."
  (interactive)
  (local-set-key (kbd "C-x C-s") (lambda ()
                                   (interactive)
                                   (save-buffer)
                                   (server-edit)))
  (local-set-key (kbd "C-c C-c") (lambda ()
                                   (interactive)
                                   (save-buffer)
                                   (server-edit))))

;; http://ruslanspivak.com/2007/08/18/htmlize-your-erlang-code-buffer/

(defun copy-wo-line-breaks (beg end)
  "Copies the region and calls fill-region with a large number so that there are no line breaks except for the paragraph markers in the input."
  (interactive "r")
  (save-excursion
    (kill-ring-save beg end)
    (let ((output (generate-new-buffer "*copy-wo-line-breaks output*")))
      (with-current-buffer output
    ;; Clear buffer.
        (delete-region (point-min) (point-max))
        ;; Add the new text.
        (yank)
        (mark-whole-buffer)
        (let ((fill-column 7000))
          (fill-region (point-min) (point-max)))
        (goto-char (point-min))
        ;; Get rid of multiple newlines.
        (while (re-search-forward "\n\n" nil t)
          (delete-region (match-beginning 0) (+ 1 (match-beginning 0))))
        (kill-ring-save (point-min) (point-max))
        ))
    ;(bury-buffer "*copy-wo-line-breaks output*")
    ))


(defun my-htmlize-region (beg end)
  "Htmlize region and put into <pre> tag style that is left in <body> tag
plus add font-size: 8pt"
  (interactive "r")
  (let* ((buffer-faces (htmlize-faces-in-buffer))
         (face-map (htmlize-make-face-map (adjoin 'default buffer-faces)))
         (pre-tag (format
                   "<pre style=\"%s font-size: 8pt\">"
                   (mapconcat #'identity (htmlize-css-specs
                                          (gethash 'default face-map)) " ")))
         (htmlized-reg (htmlize-region-for-paste beg end)))
    (switch-to-buffer-other-window "*htmlized output*")
    ; clear buffer
    (kill-region (point-min) (point-max))
    ; set mode to have syntax highlighting
    (html-mode)
    (save-excursion
      (insert htmlized-reg))
    (while (re-search-forward "<pre>" nil t)
      (replace-match pre-tag nil nil))
    (goto-char (point-min))
    (mark-whole-buffer)
    (copy-region-as-kill-nomark (point-min) (point-max))
    ))


;;; Final version: while
(defun count-words-region (beginning end)
  "Print number of words in the region."
  (interactive "r")
  (message "Counting words in region ... ")

;;; 1. Set up appropriate conditions.
  (save-excursion
    (let ((count 0))
      (goto-char beginning)

;;; 2. Run the while loop.
      (while (and (< (point) end)
                  (re-search-forward "\\w+\\W*" end t))
        (setq count (1+ count)))

;;; 3. Send a message to the user.
      (cond ((zerop count)
             (message
              "The region does NOT have any words."))
            ((= 1 count)
             (message
              "The region has 1 word."))
            (t
             (message
              "The region has %d words." count))))))

(defun prefix-region (prefix)
  "Add a prefix string to each line between mark and point."
  (interactive "Prefix string: ")
  (if prefix
      (let ((count (count-lines (mark) (point))))
        (goto-char (min (mark) (point)))
        (while (> count 0)
          (setq count (1- count))
          (beginning-of-line 1)
          (insert prefix)
          (end-of-line 1)
          (forward-char 1)))))

;; Found some of these from this thing.
;; http://news.slashdot.org/news/08/11/07/0533222.shtml

(mouse-avoidance-mode 'cat-and-mouse)
(fset 'yes-or-no-p 'y-or-n-p)

;; http://emacs-fu.blogspot.com/2008/12/highlighting-todo-fixme-and-friends.html
;; http://emacs-fu.blogspot.com/2008/12/showing-and-hiding-blocks-of-code.html

;; M-x global-set-key will ask for the key and what to bind it to.

;; Here's how to do column editing:
;; M-x cua-mode, then hit C-return
;;
;; http://trey-jackson.blogspot.com/2008/10/emacs-tip-26-cua-mode-specifically.html

;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/yasnippet/snippets/")

;; http://emacs-fu.blogspot.com/2008/12/quickly-switching-between-header-and.html

(defun macroexpand-last-sexp ()
  (interactive)
  (message (pp-to-string (macroexpand (sexp-at-point)))))

(defun scheme-send-buffer ()
  (interactive)
  (scheme-send-region (point-min) (point-max)))





;; C-x r t string-rectangle for rectangle editing, very nice!

;; For tramp files the format looks like this:
;; /name@host:/path/file

;; Do I really need this now that I have w3m?
(defun my-fetch-url (url)
  "Fetch the given URL into a buffer and switch to it."
  (interactive (list (read-string "URL: ")))
  (require 'url-handlers)
  (let ((outer (generate-new-buffer (format "*URL: %s*"
                                            (substring url 0 40)))))
    (message "Fetching URL ...")
    (url-retrieve
     url
     `(lambda (status)
        (let ((results (current-buffer))
              size-and-charset)
          (with-current-buffer ,outer
            (setq success (url-insert results))
            (kill-buffer results)
            (unless (cadr size-and-charset)
              (decode-coding-inserted-region
               (point-min) (point-max) (buffer-name ,outer)))
            (goto-char (point-min)))
          (switch-to-buffer ,outer))))))

;; This is what I want!
;; http://www.gnu.org/software/emacs/elisp/html_node/Remapping-Commands.html#Remapping-Commands
(defun my-string-insert-rectangle (start end string)
  "Insert STRING on each line of region-rectangle, shifting text right.

When called from a program, the rectangle's corners are START and END.
The left edge of the rectangle specifies the column for insertion.
This command does not delete or overwrite any existing text."
  (interactive
   (progn (barf-if-buffer-read-only)
          (setf my-buffer (current-buffer))
          (setf my-touched nil)
          (setf my-begin (region-beginning))
          (setf my-end (region-end))
	  (list
	   (region-beginning)
	   (region-end)
       (completing-read "String insert rectangle: "
                        'my-completion)
;; 	   (read-string (format "String insert rectangle (default %s): "
;; 			    (or (car string-rectangle-history) ""))
;; 			nil 'string-rectangle-history
;; 			(cabr string-rectangle-history))
       )))
  (when my-touched
    (undo))
  (apply-on-rectangle 'string-rectangle-line my-begin my-end string nil))

;; In ansi-term mode
;; C-c C-j to jump to line mode (normal emacsin')
;; C-c C-k to jump back to char mode (normal terminalin')


;; I want to be able to refer to each window by a number.

;; 0 is the minibuffer
;; 1 is the top left
;; 2 is the one right of it or below it. etc.

(defun top-window ()
  (let ((top))
    (walk-windows
     (lambda (window)
       (let ((box (window-edges window)))
         (if (and (= 0 (car box)) (= 0 (cadr box)))
             (setf top window)))))
    top
    ))

(defun other-window-from-top (n &optional window)
  (interactive "nSwitch to window number: ")
  (if (= n 0)
      (select-window (minibuffer-window))
      (if (= n 1)
          (select-window (or window (top-window)))
          (other-window-from-top (- n 1) (next-window (or window (top-window)))))))

(defun save-buffer-without-newline ()
  (interactive)
  (let ((require-final-newline 1))
    (save-buffer)))

(defun my-auto-install (arg)
  "I normally want anything-auto-install, but sometimes I don't."
  (interactive "p")
  (if (= 1 arg)
      (anything-auto-install-from-emacswiki)
      (auto-install-from-emacswiki)))

(defun ido-execute-command ()
  (interactive)
  (call-interactively
   (intern
    (ido-completing-read
     "M-x "
     (progn
       (unless ido-execute-command-cache
         (mapatoms (lambda (s)
                     (when (commandp s)
                       (setq ido-execute-command-cache
                             (cons (format "%S" s) ido-execute-command-cache))))))
       ido-execute-command-cache)))))

;; When I do a kill, I want what is in my clipboard to be placed in
;; the kill-ring.  That's it and that's all.
(defvar my-in-clipboard-to-kill-ring nil)
(defun my-clipboard-to-kill-ring ()
  (interactive)
  (let ((my-in-clipboard-to-kill-ring t))
  (save-excursion
    (with-temp-buffer 
        (clipboard-yank)
        (message "max %d" (point-max))
        (unless (= 1 (point-max))
          (kill-region (point-min) (point-max))
          ;(rotate-yank-pointer 1)
          )
        (clipboard-kill-ring-save (point-min) (point-max))
        (yank)
        ))))

(defun my-cut-function (string &optional push)
  (unless my-in-clipboard-to-kill-ring 
    (my-clipboard-to-kill-ring))
  (x-select-text string push))

;(setq interprogram-cut-function 'my-cut-function)
;(setq interprogram-cut-function 'x-select-text)

(defun my-kill-region (beg end &optional yank-handler)
  (interactive (list (point) (mark)))
  (my-clipboard-to-kill-ring)
  (kill-region beg end yank-handler))

;; This will be great for doing a screencast.
;(require 'mwe-log-commands
;         "~/.emacs.d/mwe-log-commands.el")

(defun toggle-current-window-dedication ()
 (interactive)
 (let* ((window    (selected-window))
        (dedicated (window-dedicated-p window)))
   (set-window-dedicated-p window (not dedicated))
   (message "Window %sdedicated to %s"
            (if dedicated "no longer " "")
            (buffer-name))))


(defun my-pretty-print-xml-buffer ()
  (interactive)
  (my-pretty-print-xml-region (point-min) (point-max)))

;; http://stackoverflow.com/questions/12492/pretty-printing-xml-files-on-emacs
(defun my-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))

(defun copy-rectangle-as-kill (start end)
  "Copy rectangle with corners at point and mark; save as last killed one.
Calling from program, supply two args START and END, buffer positions.
But in programs you might prefer to use `extract-rectangle'."
  (interactive "r")
  (setq killed-rectangle (extract-rectangle start end))
  (message "Rectangle saved."))

(defun vacc ()
  (interactive)
  (find-file "/scelis@bluemoon-user1.uvm.edu:."))

(defun reload-theme ()
  (interactive)
  (let ((themes custom-enabled-themes))
    (mapc #'disable-theme themes)
    (mapc #'load-theme themes)))


;; (defun copy-rectangle-as-kill ()
;;   (interactive)
;;   (save-excursion
;;     (kill-rectangle (mark) (point))
;;     (exchange-point-and-mark)
;;     (yank-rectangle)))


;(window-number-mode)
;; http://taiyaki.org/elisp/word-count/src/word-count.el

;(autoload 'twitter-get-friends-timeline "twitter" nil t)
;(autoload 'twitter-status-edit "twitter" nil t)
;(global-set-key "\C-ct" 'twitter-get-friends-timeline)
(server-start)

;(autoload 'gambit-inferior-mode "gambit" "Hook Gambit mode into cmuscheme.") 
;(autoload 'gambit-mode "gambit" "Hook Gambit mode into scheme.")

(add-to-list 'load-path "~/.emacs.d/processing-emacs/")
(autoload 'processing-mode "processing-mode" "Processing mode" t)
(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))
(setq processing-location "/Applications/Processing.app/Contents/Resources/")
(setq processing-java-bin "java")
(setq processing-classpath "/Applications/Processing.app/Contents/Resources/Java/ant-launcher.jar:/Applications/Processing.app/Contents/Resources/Java/ant.jar:/Applications/Processing.app/Contents/Resources/Java/antlr.jar:/Applications/Processing.app/Contents/Resources/Java/core.jar:/Applications/Processing.app/Contents/Resources/Java/ecj.jar:/Applications/Processing.app/Contents/Resources/Java/jna.jar:/Applications/Processing.app/Contents/Resources/Java/pde.jar:/Applications/Processing.app/Contents/Resources/Java/quaqua.jar:")

(setq python-version-checked t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hide ((((background dark)) (:foreground "gray12"))))
 '(twitter-header-face ((t (:foreground "orange"))) t))


;; rainbow-mode covers this now
;; (defvar hexcolour-keywords
;;   '(("#[abcdefABCDEF[:digit:]]\\{6\\}"
;;      (0 (put-text-property
;;          (match-beginning 0)
;;          (match-end 0)
;;          'face (list :foreground "#ffffff" :background 
;;                      (match-string-no-properties 0)))))))

;; (defun hexcolour-add-to-font-lock ()
;;   (interactive)
;;   (font-lock-add-keywords nil hexcolour-keywords))

;; (add-hook 'css-mode-hook 'hexcolour-add-to-font-lock)

(defun set-register (register value)
      "Set Emacs register named REGISTER to VALUE.  Returns VALUE.
    See the documentation of `register-alist' for possible VALUE."
      (let ((aelt (assq register register-alist))
            (sovl (intern (concat "point-register-overlay-"
                                  (single-key-description register))))
           )
        (when (not (boundp sovl))
          (set sovl (make-overlay (point)(point)))
          (overlay-put (symbol-value sovl) 'face 'register-marker-face)
          (overlay-put (symbol-value sovl) 'help-echo
                       (concat "Register: `"
                               (single-key-description register) "'")))
        (delete-overlay (symbol-value sovl))
        (if (markerp value)
            ;; I'm trying to avoid putting overlay on newline char
            (if (and (looking-at "$")(not (looking-back "^")))
                (move-overlay (symbol-value sovl) (1- value) value)
              (move-overlay (symbol-value sovl) value (1+ value))))
        (if aelt 
            (setcdr aelt value)
          (push (cons register value) register-alist))
        value))

(defun scheme-send-string (str)
  "Send string to the inferior Scheme process."
  (interactive)
  (comint-send-string (scheme-proc) (concat str "\n"))
  ;(switch-to-scheme t)
)

(defun scheme-reset-unit-tests ()
  (interactive)
  (scheme-send-string "(check-reset!)"))

(defun scheme-run-unit-tests ()
  (interactive)
  (scheme-send-string "(check-retry!)"))

(defun scheme-change-mode-unit-tests ()
  (interactive)
  (let ((mode (completing-read
               "check mode: "
               '(("off" 1) ("summary" 2) ("report-failed" 3) ("report" 4))
               nil t "")))
    (scheme-send-string (concat "(check-set-mode! '" mode " )"))))


(defun scheme-report-unit-tests ()
  (interactive)
  (scheme-send-string "(check-report)"))

(defvar electrify-return-match
    "[\]}\)\"]"
    "If this regexp matches the text after the cursor, do an \"electric\"
  return.")

(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
        (save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))

(defadvice he-substitute-string (after he-paredit-fix)
  "remove extra paren when expanding line in paredit"
  (if (and paredit-mode (equal (substring str -1) ")"))
      (progn (backward-delete-char 1) (forward-char))))

(defun minibuffer-quit ()
  "Quit the minibuffer command, even when the minibuffer loses focus."
  (interactive)
  (when (active-minibuffer-window)
    (save-window-excursion
      (select-window (minibuffer-window))
      (keyboard-escape-quit))))

(defun sudo-find-file (file-name)
  "Like find file, but opens the file as root."
  (interactive "FSudo Find File: ")
  (let ((tramp-file-name (concat "/sudo::" (expand-file-name file-name))))
    (find-file tramp-file-name)))

(eval-after-load "tex-mode" '(fset 'tex-font-lock-suscript 'ignore))
(setq-default TeX-master t)
(setq reftex-default-bibliography
      (quote
       ("references.bib")))

(defun na-org-mode-reftex-setup ()
  (interactive)
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all)))

(add-hook 'org-mode-hook 'na-org-mode-reftex-setup)

;(require 'org-latex)
;(setq org-export-latex-listings t)
;(add-to-list 'org-export-latex-packages-alist '("" "listings"))
;(add-to-list 'org-export-latex-packages-alist '("" "color"))


;; Beginning of the el4r block:
;; RCtool generated this block automatically. DO NOT MODIFY this block!
;(add-to-list 'load-path "/Users/shane/.rvm/rubies/ruby-1.9.3-p327/share/emacs/site-lisp")
;(require 'el4r)
;(el4r-boot)


;; End of the el4r block.
;; User-setting area is below this line.


(defun noweb-insert-code-mode ()
  (interactive)
  (call-interactively 'noweb-set-code-mode)
  (save-excursion
    (goto-char 1)
    (insert (format "%% -*- mode: Noweb; noweb-code-mode: %s -*-\n" noweb-code-mode))))

; (require 'keyfreq)
; (keyfreq-mode 1)
; (keyfreq-autosave-mode 1)

(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(global-set-key (kbd "C-c b") 'switch-to-previous-buffer)

(global-set-key (kbd "M-\\") 'bm-toggle)
(global-set-key (kbd "M-[") 'bm-previous)
(global-set-key (kbd "M-]") 'bm-next)

(defvar hexcolour-keywords
  '(("#[abcdef[:digit:]]\\{6\\}"
     (0 (put-text-property
         (match-beginning 0)
         (match-end 0)
         'face (list :background
                     (match-string-no-properties 0)))))))
(defun hexcolour-add-to-font-lock ()
  (font-lock-add-keywords nil hexcolour-keywords))

(add-hook 'css-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'scss-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'php-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'html-mode-hook 'hexcolour-add-to-font-lock)

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defun sudo-find-file (file-name)
  "Like find file, but opens the file as root."
  (interactive "FSudo Find File: ")
  (let ((tramp-file-name (concat "/sudo::" (expand-file-name file-name))))
    (find-file tramp-file-name)))

;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Switching-Buffers.html#Switching-Buffers
(setq switch-to-buffer-preserve-window-point 'already-displayed)

;; Helper for compilation. Close the compilation window if
;; there was no error at all. (emacs wiki)
;; http://stackoverflow.com/questions/8309769/how-can-i-prevent-emacs-from-opening-new-window-for-compilation-output
(defun compilation-exit-autoclose (status code msg)
  ;; If M-x compile exists with a 0
  (when (and (eq status 'exit) (zerop code))
    ;; then bury the *compilation* buffer, so that C-x b doesn't go there
    (bury-buffer)
    ;; and delete the *compilation* window
    (delete-window (get-buffer-window (get-buffer "*compilation*"))))
  ;; Always return the anticipated result of compilation-exit-message-function
  (cons msg code))
;; Specify my function (maybe I should have done a lambda function)
(setq compilation-exit-message-function 'compilation-exit-autoclose)

(defun browse-lucky (start end)
  (interactive "r")
  (let ((q (buffer-substring-no-properties start end)))
    (browse-url (concat "http://www.google.com/search?btnI&q="
			(url-hexify-string q)))))

(defun unity-api-lookup (string)
  "Opens up a browser to Google's first hit for the search string 'unity api reference ' plus your search term."
  (interactive (list 
                (read-string "Look up Unity API reference for: " 
                             (thing-at-point 'word) 'unity-api-lookup-history)))
  (browse-url (concat "http://www.google.com/search?btnI&q="
                      (url-hexify-string 
                       (concat "unity api reference " string)))))
