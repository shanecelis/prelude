;; quickfiles.el
;; Let's put a bunch of file locations under the binding of C-c f something.
(global-set-key "\C-cf" nil)
(defmacro file-binding (key filename)
  `(global-set-key ,(concat "\C-cf" key) 
                   (lambda () (interactive) (find-file ,filename))))
(file-binding "d" "~/School/Davis")
(file-binding "p" "~/orgfiles/passwords.org")
(file-binding "o" "~/orgfiles/personal.org")
(file-binding "w" "~/orgfiles/work.org")
(file-binding "Q" "~/orgfiles/quotes.org")
(file-binding "l" "~/orgfiles/licenses.org")
(file-binding "q" "~/.emacs.d/initbits/quickfiles.el")
(file-binding "e" "~/.emacs")
(file-binding "s" "~/.emacs.d/yasnippet/snippets/")
(file-binding "b" "~/.bashrc")
(file-binding "B" "~/.bash_profile")
(file-binding "i" "/shane@idesign.ucsc.edu:.")
(file-binding "v" "/scelis@bluemoon-user1.uvm.edu:.")
