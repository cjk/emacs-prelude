;;package-manager
(require 'package)
; Probably not needed with new prelude
;(add-to-list 'package-archives             '("marmalade" . "http://marmalade-repo.org/packages/") t)
;(add-to-list 'package-archives             '("tromey" . "http://tromey.com/elpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(setq  my-packages '(ac-slime
                     rspec-mode
                     auto-complete
                     smex
                     twittering-mode))

(defun install-my-packages ()
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))


(install-my-packages)
;;end package management
