(setq
 ns-command-modifier   'meta       ; Apple/Command key is Meta
 ns-alternate-modifier 'super      ; Option is the Mac Option key
 mouse-wheel-scroll-amount '(1)
 mouse-wheel-progressive-speed nil
 )

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-S-f") 'prelude-indent-buffer)
(global-set-key (kbd "C-:") 'switch-to-previous-buffer)


;; Add my personal figs
(set-frame-parameter (selected-frame) 'alpha '(94 76))
(menu-bar-mode 1)
(global-linum-mode 1)
(setq default-tab-width 2)


(defun maximize-frame ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))

(setq ispell-dictionary "English")

(require 'rspec-mode)

;; rbenv
(setq exec-path (cons "~/.rbenv/bin" exec-path))
(setenv "PATH" (concat "~/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons "~/.rbenv/shims" exec-path))
(setenv "PATH" (concat "~/.rbenv/shims:" (getenv "PATH")))

(add-hook 'before-save-hook 'whitespace-cleanup nil t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'prelude-turn-off-whitespace t)
