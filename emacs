(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                     ("melpa" . "https://melpa.org/packages/")))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(org-babel-do-load-languages 'org-babel-load-languages
    '(
        (shell . t)
    )
)

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

(setq x-select-enable-clipboard t)

(define-key evil-motion-state-map ";" 'evil-ex)
