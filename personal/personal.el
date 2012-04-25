;Apple, think different
(setq
 ns-command-modifier   'meta            ; Apple/Command key is Meta
 ns-alternate-modifier 'super           ; Option is the Mac Option key
 mouse-wheel-scroll-amount '(1)
 mouse-wheel-progressive-speed nil
 )

;Some functions
(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))

(defun maximize-frame ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))

;Look and feel
(set-frame-parameter (selected-frame) 'alpha '(88 76))
(add-to-list 'default-frame-alist '(width . 268))
(add-to-list 'default-frame-alist '(height . 55))
(menu-bar-mode 1)
(global-linum-mode 1)
(blink-cursor-mode t)
(global-hl-line-mode -1)

;More sets
(setq ispell-dictionary "en")
(setq default-tab-width 2)
(setq js-indent-level 2) ;nerd rage I must set this separate from 'default-tab-width

;; Ruby
(setq exec-path (cons "~/.rbenv/bin" exec-path))
(setenv "PATH" (concat "~/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons "~/.rbenv/shims" exec-path))
(setenv "PATH" (concat "~/.rbenv/shims:" (getenv "PATH")))

(require 'rspec-mode)
(define-key rspec-mode-verifible-keymap (kbd "s") 'rspec-verify-single)
(setq rspec-spec-command "rspec"
      rspec-use-rake-flag nil)
(add-to-list 'auto-mode-alist '("\\.rake" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec" . ruby-mode))


; Captain hooks
(add-hook 'before-save-hook 'whitespace-cleanup nil t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'prelude-turn-off-whitespace t)
(add-hook 'clojure-mode-hook          (lambda () (paredit-mode t)))
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode t)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode t)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode t)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode t)))

;Smexy
(smex-initialize)
(smex-auto-update 30)
(setq smex-show-unbound-commands t)


(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-S-f") 'prelude-indent-buffer)
(global-set-key (kbd "C-:") 'switch-to-previous-buffer)
