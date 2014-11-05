(require 'anything)
(require 'anything-config)
(require 'anything-etags)
(require 'anything-complete)
(require 'anything-auto-install)
(require 'descbinds-anything)
(require 'anything-match-plugin)
(require 'anything-grep)

(descbinds-anything-install)

(setq anything-sources
      (list anything-c-source-buffers
            anything-c-source-buffer-not-found
            anything-c-source-file-name-history
            ;anything-c-source-info-pages
            ;anything-c-source-info-elisp
            ;anything-c-source-man-pages
            ;anything-c-source-locate
            anything-c-source-emacs-commands
            anything-c-source-bookmarks
            ))
