;; take some time and think about this one. just turning it off for now
(setq auto-save-default nil
      make-backup-files nil
      backup-inhibited t)

(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)         ; not obvious what this does but i trust i dont need it
(set-fringe-mode 0)       ; probably the only one here that might be worth tinkering with
(menu-bar-mode -1)
(setq visible-bell t)     ; i think i might like this??...

(setq initial-scratch-message nil)

;; "C-x b" seems to be handling this now!?...
(recentf-mode 1)
(setq recentf-max-saved-items 1000)

;; this needs work to be useful
;; /home/sean/.config/emacs-configs/another-try/history
(setq history-length 100)
(savehist-mode t)

;; trying this out
;; /home/sean/.config/emacs-configs/another-try/places
(save-place-mode t)

;; emacs autoload variable into sepearte file
(setq custom-file (locate-user-emacs-file "custom-set-variables.el"))
(load custom-file 'noerror 'nomessage)

;; there is some other interesting stuff involving electric
(electric-pair-mode 1)

(setq packages-root-path "/home/sean/.config/emacs-configs/no-package-manager/packages/")
(setq packages
      (list
       "async"
       "compat"
       "consult"
       "dash"
       "ef-themes"
       "keycast"
       "magit/lisp"
       "marginalia"
       "olivetti"
       "orderless"
       "org-auto-tangle"
       "org-bullets"
       "vertico"
       "which-key"
       "with-editor/lisp"
       "xah-fly-keys"))
(dolist (package packages) (add-to-list 'load-path (concat packages-root-path package)))

(set-face-attribute 'default nil :font "Iosevka Comfy Extrabold" :height 150)

(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t)
	;; plenty of fun to be had here
	;; modus-themes-common-palette-overrides
	;; '((border-mode-line-active unspecified)
	;;   (border-mode-line-inactive unspecified)
	;;   ;; this all works but its not looking clear
	;;   ;; also it adversely affects light mode
	;;   ;; (bg-completion-match-1 "#f78fe7")
	;;   (fg-completion-match-0 unspecified)
	;;   (fg-completion-match-1 unspecified)
	;;   (fg-completion-match-2 unspecified)
	;;   (fg-completion-match-3 unspecified)
	;;   (bg-completion-match-0 blue-cooler)
	;;   (bg-completion-match-1 magenta-warmer)
	;;   (bg-completion-match-2 cyan-cooler)
	;;   (bg-completion-match-3 yellow)))
(load-theme 'modus-vivendi)
(define-key global-map (kbd "<f5>") #'modus-themes-toggle)

(require 'ef-themes)

(require 'xah-fly-keys)
(xah-fly-keys-set-layout "qwerty")
(setq xah-fly-use-control-key nil)
(setq xah-fly-use-meta-key nil)
(xah-fly-keys 1)

(define-key xah-fly-command-map (kbd "2") 'split-window-below)
(define-key xah-fly-command-map (kbd "4") 'split-window-right)

(define-key xah-fly-leader-key-map (kbd "X") 'execute-extended-command-for-buffer)
(define-key xah-fly-leader-key-map (kbd "f") 'consult-buffer)

(define-key xah-fly-leader-key-map (kbd "SPC") 'nil)
(define-key xah-fly-leader-key-map (kbd "SPC SPC") 'xah-fly-insert-mode-activate)
(define-key xah-fly-leader-key-map (kbd "SPC x") 'execute-extended-command-for-buffer)
(define-key xah-fly-leader-key-map (kbd "SPC i") 'ielm)

(require 'org-auto-tangle)
(add-hook 'org-mode-hook 'org-auto-tangle-mode)
(setq org-auto-tangle-default t)  ;; dont do it this way
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(require 'org-tempo)   ;; makes <s<TAB> source code snippet

(require 'magit)
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
	       (concat packages-root-path "magit/docs")))

(require 'vertico)
(vertico-mode 1)

(require 'marginalia)
(marginalia-mode 1)

(require 'orderless)
(setq completion-styles '(orderless basic)
  completion-category-overrides '((file (styles basic partial-completion))))

(require 'consult)
(define-key global-map (kbd "C-x b") #'consult-buffer)
(define-key global-map (kbd "<f6>") #'consult-theme)
(define-key global-map (kbd "C-s") #'consult-line)

(defalias 'isearch-forward 'consult-line)

(require 'keycast)
(keycast-mode-line-mode 1)

(require 'which-key)
(which-key-mode 1)

(require 'olivetti)
