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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2E3440" "#BF616A" "#A3BE8C" "#EBCB8B" "#81A1C1" "#B48EAD" "#88C0D0" "#ECEFF4"])
 '(custom-enabled-themes '(doom-nord))
 '(custom-safe-themes
   '("7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" default))
 '(exwm-floating-border-color "#1c2028")
 '(fci-rule-color "#4C566A")
 '(highlight-tail-colors ((("#394147") . 0) (("#37424e") . 20)))
 '(ispell-dictionary nil)
 '(jdee-db-active-breakpoint-face-colors (cons "#191C25" "#81A1C1"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#191C25" "#A3BE8C"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#191C25" "#434C5E"))
 '(objed-cursor-color "#BF616A")
 '(package-selected-packages '(use-package cmake-mode))
 '(rustic-ansi-faces
   ["#2E3440" "#BF616A" "#A3BE8C" "#EBCB8B" "#81A1C1" "#B48EAD" "#88C0D0" "#ECEFF4"])
 '(vc-annotate-background "#2E3440")
 '(vc-annotate-color-map
   (list
	(cons 20 "#A3BE8C")
	(cons 40 "#bbc28b")
	(cons 60 "#d3c68b")
	(cons 80 "#EBCB8B")
	(cons 100 "#e2b482")
	(cons 120 "#d99d79")
	(cons 140 "#D08770")
	(cons 160 "#c68984")
	(cons 180 "#bd8b98")
	(cons 200 "#B48EAD")
	(cons 220 "#b77f96")
	(cons 240 "#bb7080")
	(cons 260 "#BF616A")
	(cons 280 "#a05b67")
	(cons 300 "#815664")
	(cons 320 "#625161")
	(cons 340 "#4C566A")
	(cons 360 "#4C566A")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :height 2.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.5))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))
