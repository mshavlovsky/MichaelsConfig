(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)


(org-babel-do-load-languages 'org-babel-load-languages
    '(
        (shell . t)
    )
)

(setq org-confirm-babel-evaluate nil)

(require 'evil)
(evil-mode 1)

(define-key evil-visual-state-map "i" 'evil-forward-char)
(define-key evil-normal-state-map "i" 'evil-forward-char)
(define-key evil-motion-state-map "n" 'evil-next-line)
;;(define-key evil-motion-state-map "k" 'evil-previous-line)
(define-key evil-motion-state-map "e" 'evil-previous-line)
;;(define-key evil-motion-state-map "l" 'evil-forward-char)
;;(define-key evil-motion-state-map "n" 'evil-search-next)
(define-key evil-motion-state-map "k" 'evil-search-next)
(define-key evil-motion-state-map "K" 'evil-search-previous)

(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-n") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-e") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-i") 'evil-window-right)))

;;(setq x-select-enable-clipboard t)
(setq inhibit-startup-screen t)

(define-key evil-motion-state-map ";" 'evil-ex)



(setq tramp-default-method "ssh")
(load-theme 'solarized-dark t)

(defun my-babel-to-buffer ()
  "A function to efficiently feed babel code block result to a separate buffer"
  (interactive)
  (org-open-at-point)
  (org-babel-remove-result)
)
(defun my-org-mode-config ()
  "To use with `org-mode-hook'"
  (local-set-key (kbd "C-`") 'my-babel-to-buffer)
)
(add-hook 'org-mode-hook 'my-org-mode-config)
;;(add-hook 'org-babel-after-execute-hook 'my-bable-to-buffer)

(global-set-key (kbd "`") 'execute-extended-command)
(define-key evil-normal-state-map (kbd "`") 'execute-extended-command)
;; Scrolling smoothly
(setq scroll-step            1
      scroll-conservatively  10000)

(setq org-log-done 'time)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (## solarized-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
