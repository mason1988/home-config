(require 'org)
(require 'ob-tangle)
(add-to-list 'load-path "~/.emacs.d/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-auto-light-when-set (quote all-in-buffer))
 '(bmkp-last-as-first-bookmark-file "~/.emacs.bmk")
 '(dynamic-completion-mode t)
 '(emms-mode-line-mode-line-function (lambda nil))
 '(emms-source-file-default-directory "/media/florian/Elements1/Musik/")
 '(evil-intercept-maps nil)
 '(evil-overriding-maps nil)
 '(helm-c-pdfgrep-default-read-command "emacsclient '%f'")
 '(helm-dired-mode t)
 '(org-format-latex-options (quote (:foreground default :background default :scale 1.4 :html-foreground "Black" :html-background "Transparent" :html-scale 1.4 :matchers ("begin" "$1" "$" "$$" "\\(" "\\[" " $$" "$$ " " $$ " " $" "$ " " $ " "$\\" "$\\\\" "$"))))
 '(org-indirect-buffer-display (quote new-frame))
 '(org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m org-annotate-file org-bookmark org-checklist org-collector org-eshell org-eval)))
 '(org-src-fontify-natively t)
 '(preview-scale-function 1.4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;(org-babel-load-file "~/.emacs.d/emacs_config.org")
(load-file "~/.emacs.d/emacs_config.el")
