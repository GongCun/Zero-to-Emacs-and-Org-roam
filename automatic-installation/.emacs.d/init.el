(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Org and Org-roam

;;; Tell Emacs to start org-roam-mode when Emacs starts
(add-hook 'after-init-hook 'org-roam-mode)

;;; Define key bindings for Org-roam
(global-set-key (kbd "C-c n r") #'org-roam-buffer-toggle-display)
(global-set-key (kbd "C-c n i") #'org-roam-insert)
(global-set-key (kbd "C-c n /") #'org-roam-find-file)
(global-set-key (kbd "C-c n b") #'org-roam-switch-to-buffer)
(global-set-key (kbd "C-c n d") #'org-roam-find-directory)

;;; Let's also assign C-z to undo here
(global-set-key (kbd "C-z") 'undo) ;Emacs default is bound to hide Emacs.

;; Font
;;; If you want to know how to correct specify a font in Windows,
;;; invoke `eval-last-sexp' for (w32-select-font)
(set-face-attribute 'variable-pitch nil :font "Arial-11")
(set-face-attribute 'fixed-pitch nil :font "Consolas-11")
(set-face-attribute 'default nil :font "Consolas-11")
(set-fontset-font nil 'symbol (font-spec :family "Segoe UI Symbol" :size 11.0))
(set-fontset-font nil '(120491 . 120491) (font-spec :family "Cambria Math" :size 11.0)) ; Windows patch to display "delta 𝚫".
(add-hook 'text-mode-hook 'variable-pitch-mode)

;; Set theme
;;; (Optional) Setting `custom-safe-themes' to t.
;;; This prevents Emacs from asking if it is safe to load the theme.
(setq custom-safe-themes t)

;;; Automatically load the theme you like
;;; I am using Modus Operandi (light theme) here
;;; There is also modus-vivendi (dark theme)
(load-theme 'modus-operandi)

;; Ivy,Counsel, & Swiper
;;; Enable Ivy mode in general
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;;; Add Counsel and Swiper search functions
(global-set-key (kbd "C-c f r") #'counsel-recentf)
(global-set-key (kbd "C-c C-s") #'swiper)

;;; Reple default "M-x" and "C-x C-f" with Counsel version
(global-set-key (kbd "M-x") #'counsel-M-x)
(global-set-key (kbd "C-x C-f") #'counsel-find-file)

;; Optionally, you can replace these default functions with Counsel enhanced ones
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; Olivetti
;; Look & Feel for long-form writing

;;; Set the body text width
(setq olivetti-body-width 80)

;;; Enable Olivetti for text-related mode such as Org Mode
(add-hook 'text-mode-hook 'olivetti-mode)


;; Optional aditional aesthetic changes
;; Adapted from `sanity.el' in Elegant Emacs by Nicolas P. Rougier (rougier)
;; https://github.com/rougier/elegant-emacs

(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'org-mode)
(setq-default indent-tabs-mode nil)
(setq pop-up-windows nil)
(tool-bar-mode 0)

;;; Turn it on if you want to see pop-up tooltips with Org-ref mode
(tooltip-mode 0)
(scroll-bar-mode 0)

;;; Menu bar is explictly turned on for beginners. Set value to 0 to turn off.
(menu-bar-mode 1) 

;; Optional aditional aesthetic changes
;; Adapted from `elegance.el' in Elegant Emacs by Nicolas P. Rougier (rougier)
;; https://github.com/rougier/elegant-emacs

;;; Line cursor and no blink
(set-default 'cursor-type  '(bar . 1))
(blink-cursor-mode 0)

;;; Line spacing, can be 0 for code and 1 or 2 for text
(setq-default line-spacing 2)

;;; Underline line at descent position, not baseline position
(setq x-underline-at-descent-line nil)

;; Avoid #file.org# to appear
(auto-save-visited-mode)

;; Turn on highligting the pair of parenthesis when cursor is on one of the pair
(show-paren-mode 1)

;; Org-ref
;; Set up bibliography
(setq org-ref-default-bibliography '("~/path/to/your/bibliography.bib"))
(setq bibtex-completion-bibliography "~/path/to/your/bibliography.bib")
(global-set-key (kbd "<f6>") #'org-ref-helm-insert-cite-link)

;; Org-roam-bibtex
(require `org-roam-bibtex)
(add-hook 'after-init-hook #'org-roam-bibtex-mode)
(define-key org-roam-bibtex-mode-map (kbd "C-c n a") #'orb-note-actions)

;; Below, Emacs will automatically add configuration. 
;; Keep your manual configuration above this line to avoid confusion.
