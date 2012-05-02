;;Apple, think different
(setq
 ns-command-modifier   'meta            ; Apple/Command key is Meta
 ns-alternate-modifier 'super           ; Option is the Mac Option key
 mouse-wheel-scroll-amount '(1)
 mouse-wheel-progressive-speed nil
 )

;;Some functions
(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))

(defun maximize-frame ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))

;;Look and feel
(set-frame-parameter (selected-frame) 'alpha '(88 76))
(add-to-list 'default-frame-alist '(width . 120))
(add-to-list 'default-frame-alist '(height . 25))
;(menu-bar-mode 1)
(global-linum-mode 1)
(blink-cursor-mode t)
(global-hl-line-mode -1)

;;More sets
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
(add-hook 'ruby-mode-hook (lambda () (setq show-trailing-whitespace nil)))

(setq scss-compile-at-save nil)
;;(add-hook 'scss-mode-hook (lambda () (auto-complete-mode 1)))

;; Sounds cool, doesn't work
;; (require 'ruby-block)
;; (ruby-block-mode t)
;; (setq ruby-block-highlight-toggle 'overlay)
;; (setq ruby-block-highlight-toggle t)

;; Captain hooks
(add-hook 'before-save-hook 'whitespace-cleanup nil t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'prelude-turn-off-whitespace t)
(add-hook 'clojure-mode-hook          (lambda () (paredit-mode t)))
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode t)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode t)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode t)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode t)))

;;Smexy
(smex-initialize)
(smex-auto-update 30)
(setq smex-show-unbound-commands t)

;;Tweet!
(require 'twittering-mode)
(add-hook 'twittering-new-tweets-hook (lambda ()
                                        (let ((n twittering-new-tweets-count))
                                          (start-process "twittering-notify" nil "notify-send"
                                                         "-i" "/usr/share/emacs/24.1.50/etc/images/icons/hicolor/scalable/apps/emacs.svg"
                                                         "New tweets"
                                                         (format "You have %d new tweet%s"
                                                                 n (if (> n 1) "s" ""))))))
(setq twittering-use-master-password t)
(setq twittering-icon-mode 1)
(setq twittering-timer-interval 90)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-S-f") 'prelude-indent-buffer)
(global-set-key (kbd "C-:") 'switch-to-previous-buffer)
(setq yas/trigger-key "C-c .")
