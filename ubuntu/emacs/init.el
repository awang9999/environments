;; Emacs Configuration File
;; Author: Alexander Wang
;; Email: alexander.wang2001@gmail.com
;; Last updated: Jan 2023

;; Setting up use-package
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
)
(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-expand-minimally t)
)

;; Environment variables
(setq inhibit-startup-message t) ;; Don't show the splash screen
(setq visible-bell nil) ;; Don't flash when the bell ringsx
(setq scroll-conservatively most-positive-fixnum) ;; "disables" autoscrolling to center


;; Cursor settings
(setq-default cursor-type '(bar . 2))
(set-cursor-color "#ffffff")
(blink-cursor-mode 0)

;; Turn off some unnecessary UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Turn on line numbers for programming modes
(add-hook 'prog-mode-hook 'linum-mode)
(setq linum-format " %d")

;; Set font
(set-face-attribute 'default nil :font "Ubuntu Mono" :height 140)


;; Turn on tab-bar-mode for and configure it
(add-hook 'prog-mode-hook 'tab-bar-mode)

;; Installing pdf-tools and friends
(use-package pdf-tools)
(use-package pdf-occur)
(use-package pdf-history)
(use-package pdf-links)
(use-package pdf-outline)
(use-package pdf-annot)
(use-package pdf-sync)

;;; Code:
(pdf-tools-install)

;; midnite mode hook
(add-hook 'pdf-view-mode-hook (lambda ()
                                (pdf-view-midnight-minor-mode))) ; automatically turns on midnight-mode for pdfs

(setq pdf-view-midnight-colors '("#d8dee9" . "#3b4252")) ; set the green profile as default (see below)

(defun pdf-no-filter ()
  "View pdf without colour filter."
  (interactive)
  (pdf-view-midnight-minor-mode -1)
  )

;; change midnite mode colours functions
(defun pdf-midnite-nord-original ()
  "Set pdf-view-midnight-colors to Nord colour scheme colours."
  (interactive)
  (setq pdf-view-midnight-colors '("#d8dee9" . "#3b4252")) ; Nord colour palette
  (pdf-view-midnight-minor-mode)
  )

(defun pdf-midnite-nord-amber ()
  "Set pdf-view-midnight-colors to Nord colour scheme yellow on slate gray."
  (interactive)
  (setq pdf-view-midnight-colors '("#ebcb8b" . "#3b4252")) ; Nord colour palette
  (pdf-view-midnight-minor-mode)
  )

(defun pdf-midnite-nord-green ()
  "Set pdf-view-midnight-colors to Nord colour scheme green on slate gray."
  (interactive)
  (setq pdf-view-midnight-colors '("#a3be8c" . "#3b4252")) ; Nord colour palette
  (pdf-view-midnight-minor-mode)
  )

(defun pdf-midnite-nord-blue ()
  "Set pdf-view-midnight-colors to Nord colour scheme blue on slate gray."
  (interactive)
  (setq pdf-view-midnight-colors '("#88c0d0" . "#3b4252")) ; Nord colour palette
  (pdf-view-midnight-minor-mode)
  )

(defun pdf-midnite-colour-schemes ()
  "Midnight mode colour schemes bound to keys"
  (local-set-key (kbd "!") (quote pdf-no-filter))
  (local-set-key (kbd "@") (quote pdf-midnite-nord-amber))
  (local-set-key (kbd "#") (quote pdf-midnite-nord-green))
  (local-set-key (kbd "$") (quote pdf-midnite-nord-blue))
  (local-set-key (kbd "%") (quote pdf-midnite-nord-original))
  )

(add-hook 'pdf-view-mode-hook 'pdf-midnite-colour-schemes)


;; Installing vterm
(use-package vterm
  :ensure t)

;; Installing and configuring markdown-mode
(use-package markdown-mode
  :mode ("\\.md\\'" . markdown-mode))

;; Installing json-mode
(use-package json-mode)

;; Installing yaml mode
(use-package yaml-mode)

;; Installing and configuring paren
(use-package paren
  :ensure nil
  :init
  (setq show-paren-delay 0)
  :config
  (show-paren-mode +1))

;; Installing doom-themes and setting the Nord theme 
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-nord t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;; (doom-themes-neotree-config)
  ;; or for treemacs users
  ;; (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  ;; (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(vterm pdf-tools markdown-mode json-mode yaml-mode use-package doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
