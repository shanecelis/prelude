;; macosx.el

(defun pbcopy (beg end)
  "Copies a region to Mac OS X's paste buffer.  Useful if I'm
using emacs in terminal mode."
  (interactive "r")
  (shell-command-on-region beg end "/usr/bin/pbcopy"))

(defun pbpaste ()
  "Copies a region to Mac OS X's paste buffer.  Useful if I'm
using emacs in terminal mode."
  (interactive)
  (shell-command "/usr/bin/pbpaste" t))

(defun safariurl ()
  "Copies Safari's top window's URL into Mac OS X's paste buffer."
  (interactive)
  (shell-command "/home/shane/bin/safariurl | /usr/bin/pbcopy"))

;(defun tinyurl ()
  
  

;; This would be even better if it worked on a display that didn't have the menu bar.
;; (defun toggle-fullscreen () 
;;   (interactive) 
;;   (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen) 
;;                                            nil 
;;                                            'fullboth)))

;; (defun toggle-fullscreen (&optional f)
;;       (interactive)
;;       (let ((current-value (frame-parameter nil 'fullscreen)))
;;            (set-frame-parameter nil 'fullscreen
;;                                 (if (equal 'fullboth current-value)
;;                                     (if (boundp 'old-fullscreen) old-fullscreen nil)
;;                                     (progn (setq old-fullscreen current-value)
;;                                            'fullboth)))))

;; This is the same key binding as the mac application Mega Zoom which
;; works with any Cocoa application.  
;(global-set-key (kbd "<A-return>") 'ns-toggle-fullscreen)

;; (require 'itunes)

;; (global-set-key (kbd "C-c SPC") 'itunes-playpause)
;; (global-set-key (kbd "C-c <right>") 'itunes-next-track)
;; (global-set-key (kbd "C-c <left>") 'itunes-previous-track)
;; (global-set-key (kbd "C-c <up>") 'itunes-volume-up)
;; (global-set-key (kbd "C-c <down>") 'itunes-volume-down)
