(add-to-list 'load-path "~/.emacs.d/")
;(add-to-list 'load-path "~/.emacs.d/predictive/latex/")
;(add-to-list 'load-path "~/.emacs.d/predictive/texinfo/")
;(add-to-list 'load-path "~/.emacs.d/predictive/html/")
(add-to-list 'load-path "~/.emacs.d/magit/")
(add-to-list 'load-path "~/.emacs.d/bookmark+/")
(add-to-list 'load-path "~/.emacs.d/expand-region/")

(add-to-list 'load-path "~/.emacs.d/auctex/")
(add-to-list 'load-path "~/.emacs.d/auctex/preview/")

(require 'latex)

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(require 'bookmark+)

(add-to-list 'load-path "~/.emacs.d/helm/")
(add-to-list 'load-path "~/.emacs.d/evil/")
(add-to-list 'load-path "~/.emacs.d/auto-complete/")
;(add-to-list 'load-path "~/.emacs.d/icicles/")

(require 'helm-config)
(require 'evil)
(evil-mode 1)

(add-to-list 'load-path "~/.emacs.d/emms/")
(require 'emms-setup)
(emms-all)
(emms-default-players)
(require 'emms-player-vlc)
(setq emms-player-list '(emms-player-vlc))

(require 'org-install)
(require 'my-org-screenshot)

(require 'evil-key-bindings)
;(helm-mode 1)

;(setq helm-samewindow nil)

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
(menu-bar-mode 0)
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

;(setq pylookup-dir "~/.emacs.d/pylookup/")
;(add-to-list 'load-path pylookup-dir)
;(eval-when-compile (require 'pylookup))
;(setq pylookup-program (concat pylookup-dir "/pylookup.py"))
;(setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))
;(autoload 'pylookup-lookup "pylookup" "Lookup SEARCH-TERM in the Python HTML indexes." t)
;(autoload 'pylookup-update "pylookup" "Run pylookup-update and create the database at 'pylookup-db.file'." t)

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

;(setq ropemacs-autoimport-modules '("os" "shutil"))
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
 '(bmkp-auto-light-when-set (quote all-in-buffer))
 '(bmkp-last-as-first-bookmark-file "/home/florian/.emacs.d/bookmarks")
 '(dynamic-completion-mode t)
 '(emms-mode-line-mode-line-function (lambda nil))
 '(helm-c-pdfgrep-default-read-command "emacsclient '%f'")
 '(helm-dired-mode t)
 '(org-agenda-files (quote ("~/Zettelkasten/zettelkasten.org")))
 '(org-format-latex-options (quote (:foreground default :background default :scale 1.4 :html-foreground "Black" :html-background "Transparent" :html-scale 1.4 :matchers ("begin" "$1" "$" "$$" "\\(" "\\["))))
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

(server-start)
(require 'org-protocol)
(require 'winner)
(winner-mode 1)
;(require 'ido)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-case-fold t)
(setq confirm-nonexistent-file-or-buffer nil)
(scroll-bar-mode 0)

(global-set-key (kbd "C-c f") 'evil-emacs-state)
(global-set-key (kbd "C-c q") 'evil-force-normal-state)
(define-key evil-normal-state-map (kbd "C-c f") 'evil-emacs-state)
(define-key evil-normal-state-map (kbd "C-c q") 'evil-force-normal-state)

;(global-set-key (kbd "C-u") 'evil-scroll-up)
;(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(global-set-key (kbd "M-k") 'evil-window-prev)
(define-key evil-normal-state-map (kbd "M-k") 'evil-window-prev)
(global-set-key (kbd "C-c b") 'view-buffer-other-window)
;(global-set-key (kbd "C-d") 'evil-scroll-down)

(global-set-key (kbd "C-x f") 'ido-find-file)
(global-set-key (kbd "C-x C-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer-other-window)

(global-set-key (kbd "C-ö b") 'ido-display-buffer)
(global-set-key (kbd "C-ö f") 'ido-display-file)

(require 'naviplus)
(require 'recentf-ido)
(global-set-key (kbd "C-x g") 'recentf-interactive-complete)
(require 'empty_jump)
(global-set-key (kbd "C-ö n") 'jumpToNextEmpty)
(global-set-key (kbd "C-ö r") 'jumpToPrevEmpty)
(global-set-key (kbd "C-ö C-n") 'jumpToNextEmpty)
(global-set-key (kbd "C-ö C-r") 'jumpToPrevEmpty)
(global-set-key (kbd "C-)") 'jumpToNextEmpty)
(global-set-key (kbd "C-(") 'jumpToPrevEmpty)
(require 'cstm_regex)

(global-set-key (kbd "C-}") 'cstmRegexNext)
(global-set-key (kbd "C-{") 'cstmRegexPrev)
(global-set-key (kbd "C-ö t") 'org-tree-to-indirect-buffer)
(global-set-key (kbd "C-ö h") 'pop-global-mark)
(global-set-key (kbd "C-ä n") 'yas-new-snippet)
(global-set-key (kbd "C-ä q") 'yas-load-snippet-buffer)
(global-set-key (kbd "C-ö g") 'jump-vert-up)
(global-set-key (kbd "C-ö G") 'jump-vert-down)
(global-set-key (kbd "C-ö l") 'list-matching-lines)

(add-hook 'evil-insert-state-entry-hook
 (lambda ()
 (define-key evil-insert-state-local-map "\M-j" 'evil-window-next)
 (define-key evil-insert-state-local-map "\M-k" 'evil-window-prev)
 (define-key evil-insert-state-local-map "\M-x" 'execute-extended-command)
 )
)

(global-set-key (kbd "C-!") 'evil-normal-state)

(undo-tree-mode t)

(require 'org-nav)
(require 'goto-last-change)

;;fix für eshell
(setq eshell-prompt-function
      (lambda ()
	(concat (eshell/pwd) "\n$"))
      eshell-prompt-regexp (concat "^" (regexp-quote "$")))

(require 'magit)
(global-set-key (kbd "C-ö m l") 'magit-pull)
(global-set-key (kbd "C-ö m h") 'magit-push)
(global-set-key (kbd "C-ö m s") 'magit-status)



(add-to-list 'load-path "~/.emacs.d/w3m/")
(require 'w3m-load)

(require 'yasnippet)
(yas--initialize)
(yas/load-directory "~/.emacs.d/snippets")

(require 'yasnippet-config)
(global-set-key (kbd "C-ä g") 'yas/make-placeholder)
(global-set-key (kbd "C-ä f") 'yas/new-snippet-with-content)
(global-set-key (kbd "C-ä h") 'yas/oneshot-snippet)

(global-set-key (kbd "C-e") 'keyboard-quit)
(define-key evil-normal-state-map "\C-e" 'keyboard-quit)
(define-key evil-motion-state-map "\C-e" 'keyboard-quit)
(define-key evil-insert-state-map "\C-e" 'evil-normal-state)

(global-set-key (kbd "C-ä k") 'epa-encrypt-region)
(global-set-key (kbd "C-ä K") 'epa-decrypt-region)

(global-set-key (kbd "C-ä e") 'eval-region)
(global-set-key (kbd "C-ä E") 'eval-buffer)
(global-set-key (kbd "C-ä s") 'my-org-screenshot)

(require 'smart-forward)
(global-set-key (kbd "M-<up>") 'smart-up)
(global-set-key (kbd "M-<down>") 'smart-down)
(global-set-key (kbd "M-<left>") 'smart-backward)
(global-set-key (kbd "M-<right>") 'smart-forward)

(require 'dired+)
(require 'tidy-org-jump)
(require 'lua-mode)

(setq evil-default-cursor t)
;(set-foreground-color "green")
;(set-background-color "black")
;(set-cursor-color "blue")

(load-theme 'tsdh-light)

(require 'search-all-buffers)
(global-set-key (kbd "C-ö o") 'search-all-buffers)
(global-set-key (kbd "C-ö o") 'helm-occur)
(global-set-key (kbd "C-ö C-o") 'helm-multi-occur)

(global-set-key (kbd "C-ö d") 'doc-view-mode)
(define-key evil-normal-state-map "u" 'undo-tree-undo)
(define-key evil-normal-state-map "U" 'undo-tree-redo)

(require 'my-make-latex)
(global-set-key (kbd "C-ä l") 'my-make-latex)
(global-set-key (kbd "C-ä L") 'my-make-latex-replace)

(require 'multi-term)

(global-set-key (kbd "C-ä w s") 'save-current-configuration)
(global-set-key (kbd "C-ä w r") 'resume)

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(global-unset-key (kbd "C-t"))
(global-set-key (kbd "C-t") popwin:keymap)
(define-key evil-normal-state-map (kbd "C-t") popwin:keymap)
(define-key evil-insert-state-map (kbd "C-t") popwin:keymap)


(require 'grep)
(defun shortcut-grep()
  (interactive)
  (grep "test")
  (lgrep "-key" "/home/florian/.emacs"))

(global-set-key (kbd "C-ä x") 'shortcut-grep)

(global-set-key (kbd "C-ö e n") 'emms-next)
(global-set-key (kbd "C-ö e p") 'emms-previous)
(global-set-key (kbd "C-ö e P") 'emms-pause)
(global-set-key (kbd "C-ö e s") 'emms-shuffle)
(global-set-key (kbd "C-ö e r") 'emms-repeat)
;(define-key evil-normal-state-map (kbd "C-t") 'evil-scroll-up)
(global-set-key (kbd "C-ö e f") 'emms-add-find)
(global-set-key (kbd "C-ö e d") 'emms-add-directory-tree)
(global-set-key (kbd "C-ö e l") 'emms-playlist-mode-go)

(defun dedi_func ()
  "makes currently selected window strongly dedicated to its buffer"
  (interactive)
  (set-window-dedicated-p (frame-selected-window) t)
  (message "window dedicated!"))
(defun undedi_func ()
  "removes dedication from currently selected window"
  (interactive)
  (set-window-dedicated-p (frame-selected-window) nil)
  (message "window undedicated!"))
(global-set-key (kbd "C-ä w d") 'dedi_func)
(global-set-key (kbd "C-ä w D") 'undedi_func)

(global-set-key (kbd "C-ä w u") 'winner-undo)

(define-key evil-normal-state-map "s" 'evil-backward-char)
(define-key evil-normal-state-map "n" 'evil-next-line)
(define-key evil-normal-state-map "r" 'evil-previous-line)
(define-key evil-normal-state-map "t" 'evil-forward-char)

(define-key evil-motion-state-map "s" 'evil-backward-char)
(define-key evil-motion-state-map "n" 'evil-next-line)
(define-key evil-motion-state-map "r" 'evil-previous-line)
(define-key evil-motion-state-map "t" 'evil-forward-char)



(define-key evil-normal-state-map "k" 'evil-substitute)
(define-key evil-normal-state-map "j" 'evil-replace)
(define-key evil-normal-state-map "h" 'evil-search-next)
(define-key evil-normal-state-map "H" 'evil-search-previous)
(define-key evil-normal-state-map "l" 'evil-find-char-to)
(define-key evil-normal-state-map "L" 'evil-find-char-to-backward)

(define-key evil-motion-state-map "k" 'evil-substitute)
(define-key evil-motion-state-map "j" 'evil-replace)
(define-key evil-motion-state-map "h" 'evil-search-next)
(define-key evil-motion-state-map "H" 'evil-search-previous)
(define-key evil-motion-state-map "l" 'evil-find-char-to)
(define-key evil-motion-state-map "L" 'evil-find-char-to-backward)

(define-key evil-motion-state-map "\M-r" 'windmove-up)
(define-key evil-normal-state-map "\M-r" 'windmove-up)
(define-key evil-insert-state-map "\M-r" 'windmove-up)
(define-key evil-motion-state-map "\M-n" 'windmove-down)
(define-key evil-normal-state-map "\M-n" 'windmove-down)
(define-key evil-insert-state-map "\M-n" 'windmove-down)

(define-key minibuffer-local-map "\C-e" 'keyboard-escape-quit)

(define-key evil-motion-state-map "\C-n" 'evil-scroll-down)
(define-key evil-normal-state-map "\C-n" 'evil-scroll-down)
(global-set-key "\C-n" 'evil-scroll-down)

(define-key evil-motion-state-map "\C-r" 'evil-scroll-up)
(define-key evil-normal-state-map "\C-r" 'evil-scroll-up)
(global-set-key "\C-r" 'evil-scroll-up)

(global-set-key (kbd "M-ä") 'move-to-window-line-top-bottom)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-ö") 'hippie-expand)
(global-set-key (kbd "C-ä c") 'dabbrev-completion)


(global-set-key (kbd "C-ü") (lookup-key global-map (kbd "C-x")))

(global-set-key (kbd "C-ö k") 'helm-show-kill-ring)

;;; (autoload 'pymacs-apply "pymacs")
;;; (autoload 'pymacs-call "pymacs")
;;; (autoload 'pymacs-eval "pymacs" nil t)
;;; (autoload 'pymacs-exec "pymacs" nil t)
;;; (autoload 'pymacs-load "pymacs" nil t)
;;; (autoload 'pymacs-autoload "pymacs")
;;; (pymacs-load "ropemacs" "rope")
;;; (autoload 'pymacs-load "pymacs" 't)
;;; ropemacs-enable-autoimport 'ls

(global-set-key "\C-x \C-n" 'evil-complete-next-line)
(global-set-key "\C-x \C-p" 'evil-complete-previous-line)
(define-key evil-insert-state-map "\C-x \C-n" 'evil-complete-next-line)
(define-key evil-insert-state-map "\C-x \C-p" 'evil-complete-previous-line)

(global-set-key (kbd "C-ü C-n") 'evil-complete-next-line)
(global-set-key (kbd "C-ü C-p") 'evil-complete-previous-line)
(define-key evil-insert-state-map (kbd "C-ü C-n") 'evil-complete-next-line)
(define-key evil-insert-state-map (kbd "C-ü C-p") 'evil-complete-previous-line)

(global-set-key "\M-s" 'windmove-left)
(global-set-key "\M-t" 'windmove-right)
(global-set-key "\M-r" 'windmove-up)
(global-set-key "\M-n" 'windmove-down)
(global-unset-key "\M-h")
(global-set-key (kbd "M-h M-x") 'helm-M-x)
(define-key global-map (kbd "M-h M-x") 'helm-M-x)
(define-key evil-normal-state-map (kbd "M-h M-x") 'helm-M-x)
(global-set-key (kbd "C-ö s") 'helm-do-grep)

(global-set-key (kbd "C-ö D") 'org-display-inline-images) 
(global-set-key (kbd "M-m") 'helm-for-files)
(global-set-key (kbd "C-ö h") 'helm-c-apropos)
(global-set-key (kbd "C-ö i") 'helm-imenu)

(require 'hippie-flex)
(require 'magpie)
(require 'lorem-ipsum)

(setq org-capture-templates
 '(("t" "Todo" entry (file+headline "~/Zettelkasten/todo.org" "Todo-Eingang")
        "** TODO %?")
   ("j" "Journal" entry (file+datetree "~/org/journal.org")
        "* %?\nEntered on %U\n  %i\n  %a")
   ("w" "link template" entry
    (file+headline "~/Zettelkasten/notes.org" "Links")
     "* [[%:link][%:description]]"
     :empty-lines 1 :immediate-finish :unnarrowed :kill-buffer)))

(defun messenger() (interactive) (erc :server "im.rootdir.de" :port 6668 :nick "floppycode"))
(global-set-key (kbd "C-ö a") 'helm-org-headlines)
(global-set-key (kbd "C-x j n") 'bmkp-cycle-this-buffer)

(global-set-key (kbd "C-M-n") 'jump-head-up-wrapper)
(global-set-key (kbd "C-ä r") 'repeat)

(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map (kbd "C-ö ö") 'org-capture)

(setq org-capture-templates
 '(("t" "Todo" entry (file+headline "~/Zettelkasten/todo.org" "Todo-Eingang")
        "** TODO %?")
   ("j" "Journal" entry (file+datetree "~/org/journal.org")
        "* %?\nEntered on %U\n  %i\n  %a")))
(define-key global-map (kbd "C-ö ä") 'magpie-expand)
(define-key global-map (kbd "C-ä ö") 'flosub)
