;(eval-after-load 'rcirc '(require 'rcirc-notify))
(require 'rcirc)


(add-hook 'rcirc-mode-hook (lambda ()
                             (flyspell-mode)
                             (rcirc-omit-mode)
                             (set (make-local-variable 'scroll-conservatively) 8192)))
(setq blog-post-url "http://www.blogger.com/feeds/5594832128999528489/posts/default")
(setq blog-feed-url "http://www.blogger.com/feeds/13874435327831618822/blogs/5594832128999528489/posts/default")
(setq blog-feed-page-size 25)
(defun blog-post nil "Post to weblog" (interactive)
  (gblogger-new-entry blog-post-url))
(defun blog-feed (&optional page) 
  "View recent weblog posts" (interactive "p")
  (let ((n (+ 1 (* (- page 1) blog-feed-page-size))))
    (gblogger-atom-display 
     (concat blog-feed-url
	     "?start-index=" (number-to-string n)
	     "&max-results=" (number-to-string blog-feed-page-size)))
    (message "Viewing blog posts from %d to %d" n (+ n blog-feed-page-size))))

(eval-after-load 'rcirc
  '(defun-rcirc-command reconnect (arg)
     "Reconnect the server process."
     (interactive "i")
     (unless process
       (error "There's no process for this target"))
     (let* ((server (car (process-contact process)))
	    (port (process-contact process :service))
	    (nick (rcirc-nick process))
	    channels query-buffers)
       (dolist (buf (buffer-list))
	 (with-current-buffer buf
	   (when (eq process (rcirc-buffer-process))
	     (remove-hook 'change-major-mode-hook
			  'rcirc-change-major-mode-hook)
	     (if (rcirc-channel-p rcirc-target)
		 (setq channels (cons rcirc-target channels))
	       (setq query-buffers (cons buf query-buffers))))))
       (delete-process process)
       (rcirc-connect server port nick
		      rcirc-default-user-name
		      rcirc-default-full-name
		      channels))))

(define-key rcirc-track-minor-mode-map (kbd "C-c C-f") 'rcirc-next-active-buffer)


