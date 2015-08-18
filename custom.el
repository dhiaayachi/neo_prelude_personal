
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
 '(ecb-compile-window-temporally-enlarge (quote both))
 '(ecb-eshell-auto-activate t)
 '(ecb-eshell-buffer-sync nil)
 '(ecb-options-version "2.40")
 '(ecb-tip-of-the-day nil)
 '(ecb-toggle-compile-window t)
 '(ecb-windows-width 0.15)
 '(ede-project-directories (quote ("/home/git/msp7.0_vouc")))
 '(global-semantic-decoration-mode 1)
 '(global-semantic-stickyfunc-mode 1)
 '(setq ecb-show-sources-in-directories-buffer t)
 '(srecode-cpp-namespaces (quote ("std" "boost" "POCO" "poco"))))
(require 'ecb)
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
;; (ecb-activate)

(setq cc-other-file-alist
      '(("\\.c"   (".h"))
       ("\\.cpp"   (".h"))
       ("\\.h"   (".c"".cpp"))))

(setq ff-search-directories
      '("." "../include" "../src" "../inc" "./include" "./inc"))

(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key  (kbd "C-c w") 'ff-find-other-file)))

(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)


;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
(setq helm-gtags-prefix-key "C-x c")

(require 'helm)
(require 'helm-config)
(global-set-key (kbd "C-x c") 'helm-command-prefix)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-autoresize-mode                  t ; AUTORESIZE helm window
      helm-ff-file-name-history-use-recentf t)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)
(global-set-key (kbd "C-x c C-o") 'helm-occur)
(global-set-key (kbd "C-x c C-a") 'helm-ack)

(helm-mode 1)



(require 'helm-gtags)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t

 helm-gtags-suggested-key-mapping t
 )

;; Enable helm-gtags-mode in Dired so you can jump to any tag
;; when navigate project tree with Dired
(add-hook 'dired-mode-hook 'helm-gtags-mode)

;; Enable helm-gtags-mode in Eshell for the same reason as above
(add-hook 'eshell-mode-hook 'helm-gtags-mode)

;; Enable helm-gtags-mode in languages that GNU Global supports
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'java-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; key bindings
(define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

;; ecb key binding
(global-set-key (kbd "M-]") 'ecb-show-ecb-windows)
(global-set-key (kbd "M-[") 'ecb-hide-ecb-windows)
(global-set-key (kbd "C-)") 'ecb-goto-window-edit1)
(global-set-key (kbd "C-!") 'ecb-goto-window-directories)
(global-set-key (kbd "C-@") 'ecb-goto-window-sources)
(global-set-key (kbd "C-#") 'ecb-goto-window-methods)
(global-set-key (kbd "C-$") 'ecb-goto-window-compilation)
(setq tramp-chunksize 500)
 (eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
