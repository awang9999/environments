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
(setq visible-bell nil) ;; Don't flash when the bell rings
(setq scroll-conservatively most-positive-fixnum) ;; "disables" autoscrolling to center


;; Cursor settings
(setq-default cursor-type '(bar . 2))
(set-cursor-color "#ffffff")
(blink-cursor-mode 0)

;; Turn off some unnecessary UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)

;; Load my favorite theme
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-monokai-spectrum t)

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







