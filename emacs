(require 'package)

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))

(savehist-mode 1)


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
    ;;'((dot . t))
    '((shell . t))
)

(org-babel-do-load-languages 'org-babel-load-languages
    '((dot . t))
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
;;(load-theme 'solarized-dark t)

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

;;(setq org-log-done 'time)
(require 'org)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-log-done t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-custom-commands
   '(("d" todo "DELEGATED" nil)
     ("c" todo "DONE|DEFERRED|CANCELLED" nil)
     ("w" todo "WAITING" nil)
     ("W" agenda ""
      ((org-agenda-ndays 21)))
     ("A" agenda ""
      ((org-agenda-skip-function
	(lambda nil
	  (org-agenda-skip-entry-if 'notregexp "\\=.*\\[#A\\]")))
       (org-agenda-ndays 1)
       (org-agenda-overriding-header "Today's Priority #A tasks: ")))
     ("u" alltodo ""
      ((org-agenda-skip-function
	(lambda nil
	  (org-agenda-skip-entry-if 'scheduled 'deadline 'regexp "
]+>")))
       (org-agenda-overriding-header "Unscheduled TODO entries: ")))))
 '(org-agenda-files '("~/todo.org"))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "~/notes.org")
 '(org-fast-tag-selection-single-key 'expert)
 '(org-remember-store-without-prompt t)
 '(org-remember-templates
   '((116 "* TODO %?
  %u" "~/todo.org" "Tasks")
     (110 "* %u %?" "~/notes.org" "Notes")))
 '(org-reverse-note-order t)
 '(package-selected-packages
   '(use-package yasnippet org-preview-html remember-last-theme ## solarized-theme evil))
 '(remember-annotation-functions '(org-remember-annotation))
 '(remember-handler-functions '(org-remember-handler)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq org-agenda-files (list "~/org/work.org"
                             "~/org/home.org"))

;;(define-key evil-normal-state-map (kbd "C-c a") ('org-todo-list))
;;----------------
(require 'org-install)


(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(define-key mode-specific-map [?a] 'org-agenda)

(eval-after-load "org"
  '(progn
     (define-prefix-command 'org-todo-state-map)

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)

     (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))
     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-state-map "f"
       #'(lambda nil (interactive) (org-todo "DEFERRED")))
     (define-key org-todo-state-map "l"
       #'(lambda nil (interactive) (org-todo "DELEGATED")))
     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))

  ;;   (define-key org-agenda-mode-map "\C-n" 'next-line)
  ;;   (define-key org-agenda-keymap "\C-n" 'next-line)
  ;;   (define-key org-agenda-mode-map "\C-p" 'previous-line)
  ;;   (define-key org-agenda-keymap "\C-p" 'previous-line)
  ))


(setq org-default-notes-file (concat org-directory "~/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

(add-hook 'remember-mode-hook 'org-remember-apply-template)

(define-key global-map [(control meta ?r)] 'remember)



(setq org-capture-templates
  '(("t" "Todo" entry (file+headline "~/todo.org" "Tasks")
     "* TODO %?\n  %i\n  %a")
   )
)

;;(set-default-font "JetBrains Mono 13")
(set-frame-font "JetBrains Mono 13" nil t)


(add-to-list 'org-src-lang-modes '("latex-macros" . latex))

(defvar org-babel-default-header-args:latex-macros
  '((:results . "raw")
    (:exports . "results")))

(defun prefix-all-lines (pre body)
  (with-temp-buffer
    (insert body)
    (string-insert-rectangle (point-min) (point-max) pre)
    (buffer-string)))

(defun org-babel-execute:latex-macros (body _params)
  (concat
   (prefix-all-lines "#+LATEX_HEADER: " body)
   "\n#+HTML_HEAD_EXTRA: <div style=\"display: none\"> \\(\n"
   (prefix-all-lines "#+HTML_HEAD_EXTRA: " body)
   "\n#+HTML_HEAD_EXTRA: \\)</div>\n"))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        ))

(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.


