(provide 'custom-cc-styles)
;; Make a non-standard key binding.  We can put this in
;; c-mode-base-map because c-mode-map, c++-mode-map, and so on,
;; inherit from it.
;(defun my-c-initialization-hook ()
;  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
;(add-hook 'c-initialization-hook 'my-c-initialization-hook)

;; offset customizations not in my-c-style
;; This will take precedence over any setting of the syntactic symbol
;; made by a style.
;(setq c-offsets-alist '((member-init-intro . ++)))

;; Create my personal style.

;; substatement-open 

(defconst vantrix-c-style
  '((c-tab-always-indent        . t)
    (c-basic-offset . 3)
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . +)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)
				   (statement-block-intro . +)))
    (setq indent-tabs-mode nil)
    (c-echo-syntactic-information-p . t))
  "Vantrix C Programming Style")
(c-add-style "VANTRIX_STYLE" vantrix-c-style)

(defconst gstreamer-c-style
  '((c-tab-always-indent        . t)
    (c-basic-offset . 2)
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . +)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)
                                   (statement-block-intro . +)
				   (arglist-cont-nonempty . ++)))
    (setq indent-tabs-mode nil)
    (c-echo-syntactic-information-p . t))
  "Gstreamer C Programming Style")
(c-add-style "GSTREAMER_STYLE" gstreamer-c-style)


(defconst msp-c-style
  '((c-tab-always-indent        . t)
    (c-basic-offset . 3)
    (c-comment-only-line-offset . 0)

    
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
				   (statement-cont . 0)
                                   (case-label        . +)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)
                                   (statement-block-intro . +)
				   (comment-intro . 0)
				   (member-init-intro . 0)
				   (arglist-cont-nonempty . ++)))
    (setq indent-tabs-mode nil)
    (c-echo-syntactic-information-p . t))
  "Ericsson MSP style")
(c-add-style "MSP_STYLE" msp-c-style)


(defconst php-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . +)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)
                                   (statement-block-intro . +)
                                   (arglist-cont-nonempty . ++)))
    (c-echo-syntactic-information-p . t))
  "PHP Programming Style")
(c-add-style "PHP_STYLE" php-c-style)



;; Customizations for all modes in CC Mode.
(defun custom-c-mode-common-hook ()
  ;; set my personal style for the current buffer
  ;;(if (let ((case-fold-search nil)) (string-match "gst" buffer-file-name))
  ;;  (c-set-style "GSTREAMER_STYLE")
  ;;  (c-set-style "VANTRIX_STYLE"))
 ; (if (let ((case-fold-search nil)) (string-match "php" buffer-file-name))
      (c-set-style "MSP_STYLE")
 ;   (c-set-style "cc-mode"))
  ;(c-set-style "GSTREAMER_STYLE")	
  ;; dont like auto newline
  (c-toggle-hungry-state 1)
  (c-toggle-auto-newline -1)
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))

(add-hook 'c-mode-common-hook 'custom-c-mode-common-hook)
