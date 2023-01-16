;; Emacs initialization file
;; Author: Alexander Wang
;; Email: alexander.wang2001@gmail.com
;; Last updated: Jan 2023

;; Create a variable to indicate where emacs's configuration is installed

;;; Code:
(setq EMACS_DIR "~/.emacs.d/")

;; Avoid garbage collection at statup
(setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
      gc-cons-percentage 0.6)

;; All the settings and package installation is set in configuration.org
(org-babel-load-file "~/.emacs.d/emacs-configuration.org")

(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold 1000000000 ;; 500mb
          gc-cons-percentage 0.1)))

;; Configure autosave to ~/.emacs.d/autosave instead of in the same directory
 (setq auto-save-file-name-transforms
          `((".*" ,(concat user-emacs-directory "auto-save/") t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-nord))
 '(package-selected-packages
   '(auctex lsp-ui lsp-mode pdf-occur pdf-sync company-yasnippet company yasnippet-snippets yasnippet vterm pdf-tools markdown-mode json-mode yaml-mode use-package doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
