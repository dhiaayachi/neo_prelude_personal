
(setq prelude-whitespace nil)
(setq prelude-guru nil)
(setq plantuml-jar-path "/opt/plantuml/plantuml.jar")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-auto-activate t)
 '(ecb-compile-window-height 6)
 '(ecb-toggle-compile-window t)
 '(ecb-compile-window-temporally-enlarge (quote both))
 '(ecb-eshell-buffer-sync nil)
 '(ecb-options-version "2.40")
 '(ecb-tip-of-the-day nil)
 '(ecb-windows-width 0.15)
 '(ede-project-directories (quote ("/home/git/msp7.0_vouc")))
 '(ecb-compile-window-height 6)
 '(ecb-eshell-auto-activate t)
 '(global-semantic-stickyfunc-mode 1)
 '(global-semantic-decoration-mode 1)
)
(semantic-mode 1)
(global-ede-mode 1)
(require 'compile-dir)
(global-set-key (kbd "<f5>") 'std-compile)

(require 'custom-cc-styles)

                                        ; bm Visual bookmarks
(global-set-key (kbd "<f6>") 'bm-toggle)
(global-set-key (kbd "<f7>")   'bm-next)
(global-set-key (kbd "<f8>") 'bm-previous)

                                        ; Goto line number
(global-set-key (kbd "C-:") 'goto-line)

;; Custom keybinding
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;;Save desktop mode auto save on idle
(require 'desktop)
(desktop-save-mode 1)
(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)
(setq global-semantic-sticky-func-mode t)
(require 'eshell)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)
(menu-bar-mode t)
(ecb-activate)

(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key  (kbd "C-c w") 'ff-find-other-file)))


