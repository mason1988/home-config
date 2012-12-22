(add-to-list 'load-path "~/.emacs.d/predictive/")
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/predictive/latex/")
(add-to-list 'load-path "~/.emacs.d/predictive/texinfo/")
(add-to-list 'load-path "~/.emacs.d/predictive/html/")
(add-to-list 'load-path "~/.emacs.d/magit/")
(require 'package)
(require 'predictive)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
;(add-to-list 'load-path "~/.emacs.d/helm/")
(add-to-list 'load-path "~/.emacs.d/evil/")
(add-to-list 'load-path "~/.emacs.d/auto-complete/")
(add-to-list 'load-path "~/.emacs.d/zencoding/")
(add-to-list 'load-path "~/.emacs.d/evil/")
(add-to-list 'load-path "~/.emacs.d/icicles")

;(require 'helm-config)
(require 'evil)
(evil-mode 1)

(package-initialize)
(require 'org-install)
(require 'my-org-screenshot)

(require 'evil-key-bindings)
(require 'my-keymaps)
(require 'deft)
(require 'zencoding-mode)
;(helm-mode 1)

(setq font-latex-do-multi-line t)
(setq line-number-mode t)
(require 'auto-complete)
(setq auto-complete-mode t)

(defvar user-temporary-file-directory "~/.emacs.d/backups/")
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))
(tool-bar-mode 0)
(global-font-lock-mode t)

(require 'custm-emac-keys)



(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))


(define-key ctl-x-4-map "t" 'toggle-window-split)




;; -- Display images in org mode
;; enable image mode first
(iimage-mode)
;; add the org file link format to the iimage mode regex
(add-to-list 'iimage-mode-image-regex-alist
(cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex "\\)\\]") 1))
;; add a hook so we can display images on load
(add-hook 'org-mode-hook '(lambda () (org-turn-on-iimage-in-org)))
;; function to setup images for display on load
(defun org-turn-on-iimage-in-org ()
"display images in your org file"
(interactive)
(turn-on-iimage-mode)
(set-face-underline-p 'org-link nil))
;; function to toggle images in a org bugger
(defun org-toggle-iimage-in-org ()
"display images in your org file"
(interactive)
(if (face-underline-p 'org-link)
(set-face-underline-p 'org-link nil)
(set-face-underline-p 'org-link t))
(call-interactively 'iimage-mode))

(setq pylookup-dir "~/.emacs.d/pylookup/")
(add-to-list 'load-path pylookup-dir)
(eval-when-compile (require 'pylookup))
(setq pylookup-program (concat pylookup-dir "/pylookup.py"))
(setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))
(autoload 'pylookup-lookup "pylookup" "Lookup SEARCH-TERM in the Python HTML indexes." t)
(autoload 'pylookup-update "pylookup" "Run pylookup-update and create the database at 'pylookup-db.file'." t)

(define-key minibuffer-local-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-ns-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-completion-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-must-match-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-isearch-map [escape] 'keyboard-escape-quit)

(define-key minibuffer-local-map (kbd "M-e") 'keyboard-escape-quit)
(define-key minibuffer-local-ns-map (kbd "M-e") 'keyboard-escape-quit)
(define-key minibuffer-local-completion-map (kbd "M-e") 'keyboard-escape-quit)
(define-key minibuffer-local-must-match-map (kbd "M-e") 'keyboard-escape-quit)
(define-key minibuffer-local-isearch-map (kbd "M-e") 'keyboard-escape-quit)

(setq ropemacs-autoimport-modules '("os" "shutil"))
(require 'cmd_abr)
(require 'revive)

(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Dropbox/Zettelkasten/zettelkasten.org")))
 '(org-format-latex-options (quote (:foreground default :background default :scale 1.4 :html-foreground "Black" :html-background "Transparent" :html-scale 1.4 :matchers ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(preview-scale-function 1.4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(server-start)
(require 'org-protocol)
(require 'winner)
(winner-mode 1)
;(require 'ido)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(scroll-bar-mode 0)

(global-set-key (kbd "C-c f") 'evil-emacs-state)
(global-set-key (kbd "C-c q") 'evil-force-normal-state)
(define-key evil-normal-state-map (kbd "C-c f") 'evil-emacs-state)
(define-key evil-normal-state-map (kbd "C-c q") 'evil-force-normal-state)
(global-set-key (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(global-set-key (kbd "M-k") 'evil-window-prev)
(define-key evil-normal-state-map (kbd "M-k") 'evil-window-prev)
(global-set-key (kbd "C-c b") 'view-buffer-other-window)
(global-set-key (kbd "C-ü") (lookup-key global-map (kbd "C-x")))
(global-set-key (kbd "C-d") 'evil-scroll-down)

(global-set-key (kbd "C-x f") 'ido-find-file)
(global-set-key (kbd "C-x C-f") 'ido-find-file-other-window)
;ido switch buffer normal steht schon
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer-other-window)

(global-set-key (kbd "C-ö b") 'ido-display-buffer)
(global-set-key (kbd "C-ö f") 'ido-display-file)

(require 'recentf-ido)
(global-set-key (kbd "C-x g") 'recentf-interactive-complete) 
(require 'empty_jump)
(global-set-key (kbd "C-ö r") 'jumpToNextEmpty) 
(global-set-key (kbd "C-ö i") 'jumpToPrevEmpty) 
(global-set-key (kbd "C-ö C-r") 'jumpToNextEmpty) 
(global-set-key (kbd "C-ö C-i") 'jumpToPrevEmpty) 
(global-set-key (kbd "C-)") 'jumpToNextEmpty) 
(global-set-key (kbd "C-(") 'jumpToPrevEmpty) 
(require 'cstm_regex)
(global-set-key (kbd "C-}") 'cstmRegexNext) 
(global-set-key (kbd "C-{") 'cstmRegexPrev) 

(global-set-key (kbd "C-ö t") 'org-tree-to-indirect-buffer)
(global-set-key (kbd "C-ö h") 'pop-global-mark)

(global-set-key (kbd "C-ö g") 'bookmark-jump)
(global-set-key (kbd "C-ö C-g") 'bookmark-jump)
(global-set-key (kbd "C-ö s") 'bookmark-set)

(undo-tree-mode t)

(require 'org-nav)
(require 'goto-last-change)

;;fix für eshell
(setq eshell-prompt-function
      (lambda ()
	(concat (eshell/pwd) "\n$"))
      eshell-prompt-regexp (concat "^" (regexp-quote "$")))

(require 'magit)


;;; (require 'pymacs)
;;; (autoload 'pymacs-apply "pymacs")
;;; (autoload 'pymacs-call "pymacs")
;;; (autoload 'pymacs-eval "pymacs" nil t)
;;; (autoload 'pymacs-exec "pymacs" nil t)
;;; (autoload 'pymacs-load "pymacs" nil t)
;;; (autoload 'pymacs-autoload "pymacs")
;;; 
;;; (pymacs-load "ropemacs" "rope-")
;;; 
;;; (autoload 'pymacs-load "pymacs" 't)
;;; ropemacs-enable-autoimport 't)
;;;
