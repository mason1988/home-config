
(add-to-list 'load-path "~/.emacs.d/w3m/")
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/slime/")
(add-to-list 'load-path "~/.emacs.d/evil/")
(add-to-list 'load-path "~/.emacs.d/emms/")
(add-to-list 'load-path "~/.emacs.d/bookmark+/")
(add-to-list 'load-path "~/.emacs.d/auctex/")
(add-to-list 'load-path "~/.emacs.d/magit/")
(add-to-list 'load-path "~/.emacs.d/image-dired/")
(add-to-list 'load-path "~/.emacs.d/helm/")

(add-to-list 'load-path "~/.emacs.d/icicles/")
(require 'icicles)

(require 'key-chord)
(require 'volume)
(require 'latex)
(require 'undo-tree)
(require 'org-id)
(require 'org-habit)
(require 'org-agenda)
(require 'naviplus)
(require 'recentf-ido)
(require 'empty_jump)
(require 'helm-config)
(require 'cstm_regex)
(require 'dired+)
(require 'tidy-org-jump)
(require 'lua-mode)
(require 'search-all-buffers)
(require 'my-make-latex)
(require 'multi-term)
(require 'popwin)
(require 'grep)
(require 'dedicated-buffers)
(require 'delete-pic)
(require 'ediff-extension)
(require 'rainbow-delimiters)
(require 'slime)
(require 'multi-eshell)
(require 'flosub)
(require 'hippie-flex)
(require 'magpie)
(require 'lorem-ipsum)
(require 'capture-templates)
(require 'yasnippet)
(require 'yasnippet-config)
(require 'my-org-screenshot)
(require 'w3m-load)
(require 'magit)
(require 'org-nav)
(require 'goto-last-change)
(require 'org-protocol)
(require 'winner)
(require 'revive)
(require 'evil)
(require 'emms-setup)
(require 'org-mode-config)
(require 'emms-player-vlc)
(server-start)

(setq ido-default-buffer-method 'selected-window)

(filesets-init)

(emms-all)
(emms-default-players)

(setq emms-player-list '(emms-player-vlc))
(defun messenger() (interactive) (erc :server "im.rootdir.de" :port 6668 :nick "floppycode"))
(undo-tree-mode t)

(savehist-mode t)
(global-set-key "\C-x\C-r" 'recentf-open-most-recent-file)
(recentf-mode 1)
(put 'narrow-to-page 'disabled nil)
(global-rainbow-delimiters-mode)
(setq display-buffer-function 'popwin:display-buffer)

(setq evil-default-cursor t)
(load-theme 'tsdh-light)
(yas--initialize)
(yas/load-directory "~/.emacs.d/snippets")
(winner-mode 1)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-case-fold t)
(setq confirm-nonexistent-file-or-buffer nil)
(scroll-bar-mode 0)
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(evil-mode 1)


(define-key evil-motion-state-map (kbd "s") 'evil-backward-char)
;Den Evil normal state als standard für alles setzen
(setq evil-normal-state-modes (append evil-emacs-state-modes evil-motion-state-modes evil-normal-state-modes))
;(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)
(setq evil-motion-state-modes nil)

(key-chord-mode 1)

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map 
                [remap pcomplete]
                'helm-esh-pcomplete)))

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")   
    (define-minor-mode my-keys-minor-mode
          "A minor mode so that my key settings override annoying major modes."
              t " my-keys" 'my-keys-minor-mode-map)
    
    (my-keys-minor-mode 1)
    
    (defun my-minibuffer-setup-hook ()
          (my-keys-minor-mode 0))
    
    (add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(global-set-key (kbd "C-ö e n") 'emms-next)
(global-set-key (kbd "C-ö e p") 'emms-previous)
(global-set-key (kbd "C-ö e P") 'emms-pause)
(global-set-key (kbd "C-ö e s") 'emms-shuffle)
(global-set-key (kbd "C-ö e r") 'emms-repeat)
(global-set-key (kbd "C-ö e f") 'emms-add-find)
(global-set-key (kbd "C-ö e d") 'emms-add-directory-tree)
(global-set-key (kbd "C-ö e l") 'emms-playlist-mode-go)

;dired mode
(evil-declare-key 'normal dired-mode-map (kbd "s") 'evil-backward-char)
(evil-declare-key 'normal dired-mode-map (kbd "n") 'evil-next-line)
(evil-declare-key 'normal dired-mode-map (kbd "r") 'evil-previous-line)
(evil-declare-key 'normal dired-mode-map (kbd "t") 'evil-forward-char)

(evil-declare-key 'normal dired-mode-map (kbd "M-r") 'windmove-up)
(evil-declare-key 'normal dired-mode-map (kbd "M-n") 'windmove-down)
(evil-declare-key 'normal dired-mode-map (kbd "M-s") 'windmove-left)
(evil-declare-key 'normal dired-mode-map (kbd "M-t") 'windmove-right)

(define-key evil-normal-state-map (kbd "ü") (lookup-key global-map (kbd "C-ü")))
(define-key evil-normal-state-map (kbd "ö") (lookup-key global-map (kbd "C-ö")))
(define-key evil-normal-state-map (kbd "ä") (lookup-key global-map (kbd "C-ä")))
(evil-define-key 'emacs my-keys-minor-mode-map (kbd "r") 'evil-previous-line)
(evil-define-key 'emacs my-keys-minor-mode-map (kbd "n") 'evil-next-line)
(evil-define-key 'emacs my-keys-minor-mode-map (kbd "t") 'evil-forward-char)
(evil-define-key 'emacs my-keys-minor-mode-map (kbd "s") 'evil-backward-char)
(global-set-key "\C-x \C-n" 'evil-complete-next-line)
(global-set-key "\C-x \C-p" 'evil-complete-previous-line)
(define-key evil-insert-state-map "\C-x \C-n" 'evil-complete-next-line)
(define-key evil-insert-state-map "\C-x \C-p" 'evil-complete-previous-line)

(global-set-key (kbd "C-ü C-n") 'evil-complete-next-line)
(global-set-key (kbd "C-ü C-p") 'evil-complete-previous-line)
(define-key evil-insert-state-map (kbd "C-ü C-n") 'evil-complete-next-line)
(define-key evil-insert-state-map (kbd "C-ü C-p") 'evil-complete-previous-line)

(key-chord-define evil-normal-state-map ",," 'evil-force-normal-state)
(key-chord-define evil-visual-state-map ",," 'evil-change-to-previous-state)
(key-chord-define evil-insert-state-map ",," 'evil-normal-state)
(key-chord-define evil-replace-state-map ",," 'evil-normal-state)

(key-chord-define evil-normal-state-map "ää" 'evil-execute-in-emacs-state)
(key-chord-define evil-normal-state-map "mm" 'evil-goto-mark)

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

(define-key evil-normal-state-map "\C-n" 'evil-scroll-down)
(define-key evil-normal-state-map "\C-r" 'evil-scroll-up)

(define-key my-keys-minor-mode-map (kbd "M-r") 'windmove-up)
(define-key my-keys-minor-mode-map "\C-r" 'evil-scroll-up)
(define-key my-keys-minor-mode-map "\C-n" 'evil-scroll-down)
(define-key evil-normal-state-map (kbd "M-r") 'windmove-up)
(define-key evil-normal-state-map (kbd "M-n") 'windmove-down)
(define-key evil-normal-state-map (kbd "M-s") 'windmove-left)

(define-key evil-normal-state-local-map (kbd "s") 'evil-backward-char)
;(define-key evil-normal-state (kbd "s") 'evil-backward-char)

(define-key my-keys-minor-mode-map (kbd "M-t") 'windmove-right)
(define-key my-keys-minor-mode-map "\M-x" 'execute-extended-command)
(define-key my-keys-minor-mode-map (kbd "<f8>") 'bmkp-cycle-this-buffer)

(define-key minibuffer-local-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-ns-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-completion-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-must-match-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-isearch-map [escape] 'keyboard-escape-quit)

(global-set-key (kbd "C-ä s") 'my-org-screenshot2)
(global-set-key (kbd "C-ä .") 'org-capture)
(global-set-key (kbd "<f12>") 'org-agenda)
;(global-set-key (kbd "<f5>") 'bh/org-todo)
;(global-set-key (kbd "<f7>") 'bh/set-truncate-lines)
(global-set-key (kbd "<f11>") 'org-clock-goto)

(define-key my-keys-minor-mode-map (kbd "<f7>") 'diredp-fileset)
(define-key my-keys-minor-mode-map (kbd "<f6>") 'eshell)
(key-chord-define my-keys-minor-mode-map (kbd "uu") (kbd "C-u"))

(global-set-key (kbd "<C-backspace>") 'delete-trailing-whitespace)

(define-key my-keys-minor-mode-map (kbd "<f5>") 'kill-frame)
(global-set-key (kbd "C-ä g") 'yas/make-placeholder)
(global-set-key (kbd "C-ä f") 'yas/new-snippet-with-content)
(global-set-key (kbd "C-ä h") 'yas/oneshot-snippet)
(global-set-key (kbd "C-ä k") 'epa-encrypt-region)
(global-set-key (kbd "C-ä K") 'epa-decrypt-region)
(global-set-key (kbd "C-ä e") 'eval-region)
(global-set-key (kbd "C-ä E") 'eval-buffer)
(global-set-key (kbd "C-ö O") 'search-all-buffers)
(global-set-key (kbd "C-ö o") 'helm-occur)
(global-set-key (kbd "C-ö C-o") 'helm-multi-occur)
(global-set-key (kbd "C-ö d") 'doc-view-mode)
(define-key evil-normal-state-map "u" 'undo-tree-undo)
(define-key evil-normal-state-map "U" 'undo-tree-redo)
(global-set-key (kbd "C-ä l") 'my-make-latex)
(global-set-key (kbd "C-ä L") 'my-make-latex-replace)
(global-set-key (kbd "C-ä x") 'org-preview-latex-fragment)
(global-set-key (kbd "C-ä w s") 'save-current-configuration)
(global-set-key (kbd "C-ä w r") 'resume)
(global-unset-key (kbd "C-t"))
(global-set-key (kbd "C-t") popwin:keymap)
(define-key evil-normal-state-map (kbd "C-t") popwin:keymap)
(define-key evil-insert-state-map (kbd "C-t") popwin:keymap)
(global-set-key (kbd "C-ä w d") 'dedi_func)
(global-set-key (kbd "C-ä w D") 'undedi_func)
(global-set-key (kbd "C-ä w u") 'winner-undo)


(global-set-key (kbd "C-x f") 'ido-find-file)
(global-set-key (kbd "C-ä f") 'ido-find-file-other-window)
(global-set-key (kbd "C-ä b") 'ido-switch-buffer-other-window)
(global-set-key (kbd "C-ö b") 'ido-display-buffer)
(global-set-key (kbd "C-ö f") 'ido-display-file)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x C-f") 'ido-find-file)
(global-set-key (kbd "C-ä C-b") 'ido-switch-buffer-other-window)
(global-set-key (kbd "C-ä C-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-ö C-b") 'ido-display-buffer)
(global-set-key (kbd "C-ö C-f") 'ido-display-file)


(global-set-key (kbd "C-x g") 'recentf-interactive-complete)
(global-set-key (kbd "C-ö n") 'jumpToNextEmpty)
(global-set-key (kbd "C-ö r") 'jumpToPrevEmpty)
(global-set-key (kbd "C-ö C-n") 'jumpToNextEmpty)
(global-set-key (kbd "C-ö C-r") 'jumpToPrevEmpty)
(global-set-key (kbd "C-)") 'jumpToNextEmpty)
(global-set-key (kbd "C-(") 'jumpToPrevEmpty)

(global-set-key (kbd "C-ä i") 'cstmRegexNextManager)
(global-set-key (kbd "C-ä u") 'cstmRegexPrevManager)
(global-set-key (kbd "C-ö t") 'org-tree-to-indirect-buffer)
(global-set-key (kbd "C-ö h") 'pop-global-mark)
(global-set-key (kbd "C-ä n") 'yas-new-snippet)
(global-set-key (kbd "C-ä q") 'yas-load-snippet-buffer)
(global-set-key (kbd "C-ö g") 'jump-vert-up)
(global-set-key (kbd "C-ö G") 'jump-vert-down)
(global-set-key (kbd "C-ö l") 'list-matching-lines)
(global-set-key (kbd "C-ö m l") 'magit-pull)
(global-set-key (kbd "C-ö m h") 'magit-push)
(global-set-key (kbd "C-ö m s") 'magit-status)
(global-set-key (kbd "M-ä") 'move-to-window-line-top-bottom)
(global-set-key (kbd "M-ö") 'hippie-expand)
(global-set-key (kbd "C-ä c") 'dabbrev-completion)
(global-set-key (kbd "C-ü") (lookup-key global-map (kbd "C-x")))
(global-set-key (kbd "C-ö k") 'helm-show-kill-ring)
(global-unset-key "\M-h")
(global-set-key (kbd "M-h M-x") 'helm-M-x)
(define-key global-map (kbd "M-h M-x") 'helm-M-x)
(define-key evil-normal-state-map (kbd "M-h M-x") 'helm-M-x)
(global-set-key (kbd "C-ö s") 'helm-do-grep)
(global-set-key (kbd "C-ö D") 'org-display-inline-images) 
(global-set-key (kbd "M-m") 'helm-for-files)
(global-set-key (kbd "C-ö h") 'helm-c-apropos)
(global-set-key (kbd "C-ö i") 'helm-imenu)

(global-set-key (kbd "C-x ö b") 'view-buffer-other-window)
(global-set-key (kbd "C-x ö f") 'find-file-other-window)

(defalias 'kill-frame 'delete-frame)

(global-set-key (kbd "C-ä b") 'flosub-readall)


(global-set-key (kbd "C-ä v") 'eval-expression)

(define-key evil-normal-state-map (kbd "M-w") 'bury-buffer)
(define-key evil-normal-state-map (kbd "C-ä o") 'org-babel-tangle)
(define-key evil-normal-state-map (kbd "C-ä v") 'revert-buffer)
(define-key global-map (kbd "C-ö ä") 'magpie-expand)
(define-key global-map (kbd "C-ä ö") 'flosub)
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map (kbd "C-ö ö") 'org-capture)
(global-set-key (kbd "C-ö a") 'helm-org-headlines)
(global-set-key (kbd "C-x j n") 'bmkp-cycle-this-buffer)
(global-set-key (kbd "C-M-n") 'jump-head-up-wrapper)
(global-set-key (kbd "C-ä r") 'repeat)
;(key-chord-define my-keys-minor-mode-map (kbd "öö") (kbd "C-ä r"))

(global-set-key (kbd "C-#") (lookup-key global-map (kbd "C-ü")))
(add-hook 'org-mode-hook (lambda() (define-key (current-local-map) (kbd "C-#") (lookup-key global-map (kbd "C-ü")))))
(global-set-key (kbd "C-6") (lookup-key global-map (kbd "C-ö")))
(global-set-key (kbd "C-|") (lookup-key global-map (kbd "C-ä")))

; Enable habit tracking (and a bunch of other modules)
(setq org-modules (quote (org-bbdb
                          org-bibtex
                          org-crypt
                          org-gnus
                          org-id
                          org-info
                          org-jsinfo
                          org-habit
                          org-inlinetask
                          org-irc
                          org-mew
                          org-mhe
                          org-protocol
                          org-rmail
                          org-vm
                          org-wl
                          org-w3m)))

(iimage-mode)
(add-to-list 'iimage-mode-image-regex-alist
(cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex "\\)\\]") 1))
(add-hook 'org-mode-hook '(lambda () (org-turn-on-iimage-in-org)))
(defun org-turn-on-iimage-in-org ()
(interactive)
(turn-on-iimage-mode)
(set-face-underline-p 'org-link nil))
(defun org-toggle-iimage-in-org ()
(interactive)
(if (face-underline-p 'org-link)
(set-face-underline-p 'org-link nil)
(set-face-underline-p 'org-link t))
(call-interactively 'iimage-mode))

(defun bh/widen ()
  (interactive)
  (if (equal major-mode 'org-agenda-mode)
      (org-agenda-remove-restriction-lock)
    (widen)
    (org-agenda-remove-restriction-lock)))

(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "W" 'bh/widen))
          'append)
(defun bh/find-project-task ()
  "Move point to the parent (project) task if any"
  (save-restriction
    (widen)
    (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
      (while (org-up-heading-safe)
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq parent-task (point))))
      (goto-char parent-task)
      parent-task)))
(defun bh/clock-out-maybe ()
  (when (and bh/keep-clock-running
             (not org-clock-clocking-in)
             (marker-buffer org-clock-default-task)
             (not org-clock-resolving-clocks-due-to-idleness))
    (bh/clock-in-parent-task)))
(defun bh/clock-in-parent-task ()
  "Move point to the parent (project) task if any and clock in"
  (let ((parent-task))
    (save-excursion
      (save-restriction
        (widen)
        (while (and (not parent-task) (org-up-heading-safe))
          (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
            (setq parent-task (point))))
        (if parent-task
            (org-with-point-at parent-task
              (org-clock-in))
          (when bh/keep-clock-running
            (bh/clock-in-default-task)))))))
(defun bh/punch-in (arg)
  "Start continuous clocking and set the default task to the
selected task.  If no task is selected set the Organization task
as the default task."
  (interactive "p")
  (setq bh/keep-clock-running t)
  (if (equal major-mode 'org-agenda-mode)
      ;;
      ;; We're in the agenda
      ;;
      (let* ((marker (org-get-at-bol 'org-hd-marker))
             (tags (org-with-point-at marker (org-get-tags-at))))
        (if (and (eq arg 4) tags)
            (org-agenda-clock-in '(16))
          (bh/clock-in-organization-task-as-default)))
    ;;
    ;; We are not in the agenda
    ;;
    (save-restriction
      (widen)
      ; Find the tags on the current task
      (if (and (equal major-mode 'org-mode) (not (org-before-first-heading-p)) (eq arg 4))
          (org-clock-in '(16))
        (bh/clock-in-organization-task-as-default)))))

(defun bh/punch-out ()
  (interactive)
  (setq bh/keep-clock-running nil)
  (when (org-clock-is-active)
    (org-clock-out))
  (org-agenda-remove-restriction-lock))

(defun bh/clock-in-default-task ()
  (save-excursion
    (org-with-point-at org-clock-default-task
      (org-clock-in))))
(defun bh/clock-in-to-next (kw)
  "Switch a task from TODO to NEXT when clocking in.
Skips capture tasks, projects, and subprojects.
Switch projects and subprojects from NEXT back to TODO"
  (when (not (and (boundp 'org-capture-mode) org-capture-mode))
    (cond
     ((and (member (org-get-todo-state) (list "TODO"))
           (bh/is-task-p))
      "NEXT")
     ((and (member (org-get-todo-state) (list "NEXT"))
           (bh/is-project-p))
      "TODO"))))
(defun bh/hide-other ()
  (interactive)
  (save-excursion
    (org-back-to-heading 'invisible-ok)
    (hide-other)
    (org-cycle)
    (org-cycle)
    (org-cycle)))

(defun bh/set-truncate-lines ()
  "Toggle value of truncate-lines and refresh window display."
  (interactive)
  (setq truncate-lines (not truncate-lines))
  ;; now refresh window display (an idiom from simple.el):
  (save-excursion
    (set-window-start (selected-window)
                      (window-start (selected-window)))))
(defun bh/make-org-scratch ()
  (interactive)
  (find-file "/tmp/publish/scratch.org")
  (gnus-make-directory "/tmp/publish"))

(defun bh/switch-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))
(defun bh/clock-in-task-by-id (id)
  "Clock in a task by id"
  (org-with-point-at (org-id-find id 'marker)
    (org-clock-in nil)))
(defun bh/clock-in-organization-task-as-default ()
  (interactive)
  (org-with-point-at (org-id-find bh/organization-task-id 'marker)
    (org-clock-in '(16))))

(defun bh/clock-in-last-task (arg)
  "Clock in the interrupted task if there is one
Skip the default task and get the next one.
A prefix arg forces clock in of the default task."
  (interactive "p")
  (let ((clock-in-to-task
         (cond
          ((eq arg 4) org-clock-default-task)
          ((and (org-clock-is-active)
                (equal org-clock-default-task (cadr org-clock-history)))
           (caddr org-clock-history))
          ((org-clock-is-active) (cadr org-clock-history))
          ((equal org-clock-default-task (car org-clock-history)) (cadr org-clock-history))
          (t (car org-clock-history)))))
    (widen)
    (org-with-point-at clock-in-to-task
      (org-clock-in nil))))

(defun bh/mark-next-parent-tasks-todo ()
  "Visit each parent task and change NEXT states to TODO"
  (let ((mystate (or (and (fboundp 'org-state)
                          state)
                     (nth 2 (org-heading-components)))))
    (when (equal mystate "NEXT")
      (save-excursion
        (while (org-up-heading-safe)
          (when (member (nth 2 (org-heading-components)) (list "NEXT"))
            (org-todo "TODO")))))))

(setq org-agenda-files (quote ("~/Zettelkasten/todo.org"
                               "~/Zettelkasten/logik.org"
                               "~/Zettelkasten/elementare_stochastik.org"
                               "~/Zettelkasten/webdesign.org"
                               "~/Zettelkasten/theoretische_informatik.org"
                               "~/Zettelkasten/softwaretechnik.org"
                               "~/Zettelkasten/Software.org"
                               "~/Zettelkasten/zettelkasten.org"
                               "~/Zettelkasten/refile.org"
                               "~/Zettelkasten/bugs.org"
                               "~/Zettelkasten/organisation.org")))

(defun bh/list-sublevels-for-projects-indented ()
  "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
  This is normally used by skipping functions where this variable is already local to the agenda."
  (if (marker-buffer org-agenda-restrict-begin)
      (setq org-tags-match-list-sublevels 'indented)
    (setq org-tags-match-list-sublevels nil))
  nil)

(defun bh/list-sublevels-for-projects ()
  "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
  This is normally used by skipping functions where this variable is already local to the agenda."
  (if (marker-buffer org-agenda-restrict-begin)
      (setq org-tags-match-list-sublevels t)
    (setq org-tags-match-list-sublevels nil))
  nil)
(defun bh/skip-stuck-projects ()
  "Skip trees that are not stuck projects"
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (if (bh/is-project-p)
          (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                 (has-next ))
            (save-excursion
              (forward-line 1)
              (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
                (unless (member "WAITING" (org-get-tags-at))
                  (setq has-next t))))
            (if has-next
                nil
              next-headline)) ; a stuck project, has subtasks but no next task
        nil))))

(defun bh/skip-non-stuck-projects ()
  "Skip trees that are not stuck projects"
  (bh/list-sublevels-for-projects-indented)
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (if (bh/is-project-p)
          (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                 (has-next ))
            (save-excursion
              (forward-line 1)
              (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
                (unless (member "WAITING" (org-get-tags-at))
                  (setq has-next t))))
            (if has-next
                next-headline
              nil)) ; a stuck project, has subtasks but no next task
        next-headline))))

(defun bh/skip-non-projects ()
  "Skip trees that are not projects"
  (bh/list-sublevels-for-projects-indented)
  (if (save-excursion (bh/skip-non-stuck-projects))
      (save-restriction
        (widen)
        (let ((subtree-end (save-excursion (org-end-of-subtree t))))
          (cond
           ((and (bh/is-project-p)
                 (marker-buffer org-agenda-restrict-begin))
            nil)
           ((and (bh/is-project-p)
                 (not (marker-buffer org-agenda-restrict-begin))
                 (not (bh/is-project-subtree-p)))
            nil)
           (t
            subtree-end))))
    (save-excursion (org-end-of-subtree t))))

(defun bh/skip-project-trees-and-habits ()
  "Skip trees that are projects"
  (save-restriction
    (widen)
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((bh/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       (t
        nil)))))

(defun bh/skip-projects-and-habits-and-single-tasks ()
  "Skip trees that are projects, tasks that are habits, single non-project tasks"
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (cond
       ((org-is-habit-p)
        next-headline)
       ((bh/is-project-p)
        next-headline)
       ((and (bh/is-task-p) (not (bh/is-project-subtree-p)))
        next-headline)
       (t
        nil)))))

(defun bh/skip-project-tasks-maybe ()
  "Show tasks related to the current restriction.
When restricted to a project, skip project and sub project tasks, habits, NEXT tasks, and loose tasks.
When not restricted, skip project and sub-project tasks, habits, and project related tasks."
  (save-restriction
    (widen)
    (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
           (next-headline (save-excursion (or (outline-next-heading) (point-max))))
           (limit-to-project (marker-buffer org-agenda-restrict-begin)))
      (cond
       ((bh/is-project-p)
        next-headline)
       ((org-is-habit-p)
        subtree-end)
       ((and (not limit-to-project)
             (bh/is-project-subtree-p))
        subtree-end)
       ((and limit-to-project
             (bh/is-project-subtree-p)
             (member (org-get-todo-state) (list "NEXT")))
        subtree-end)
       (t
        nil)))))

(defun bh/skip-projects-and-habits ()
  "Skip trees that are projects and tasks that are habits"
  (save-restriction
    (widen)
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((bh/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       (t
        nil)))))

(defun bh/skip-non-subprojects ()
  "Skip trees that are not projects"
  (let ((next-headline (save-excursion (outline-next-heading))))
    (if (bh/is-subproject-p)
        nil
      next-headline)))
(defun bh/is-project-p ()
  "Any task with a todo keyword subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task has-subtask))))

(defun bh/is-project-subtree-p ()
  "Any task with a todo keyword that is in a project subtree.
Callers of this function already widen the buffer view."
  (let ((task (save-excursion (org-back-to-heading 'invisible-ok)
                              (point))))
    (save-excursion
      (bh/find-project-task)
      (if (equal (point) task)
          nil
        t))))

(defun bh/is-task-p ()
  "Any task with a todo keyword and no subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task (not has-subtask)))))
(defun bh/is-subproject-p ()
  "Any task which is a subtask of another project"
  (let ((is-subproject)
        (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
    (save-excursion
      (while (and (not is-subproject) (org-up-heading-safe))
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq is-subproject t))))
    (and is-a-task is-subproject)))
(defun bh/is-not-scheduled-or-deadline (date-str)
  (and (not (bh/is-deadline date-str))
       (not (bh/is-scheduled date-str))))

(defun bh/is-due-deadline (date-str)
  (string-match "Deadline:" date-str))

(defun bh/is-late-deadline (date-str)
  (string-match "In *\\(-.*\\)d\.:" date-str))

(defun bh/is-pending-deadline (date-str)
  (string-match "In \\([^-]*\\)d\.:" date-str))

(defun bh/is-deadline (date-str)
  (or (bh/is-due-deadline date-str)
      (bh/is-late-deadline date-str)
      (bh/is-pending-deadline date-str)))

(defun bh/is-scheduled (date-str)
  (or (bh/is-scheduled-today date-str)
      (bh/is-scheduled-late date-str)))

(defun bh/is-scheduled-today (date-str)
  (string-match "Scheduled:" date-str))

(defun bh/is-scheduled-late (date-str)
  (string-match "Sched\.\\(.*\\)x:" date-str))
(setq org-agenda-cmp-user-defined 'bh/agenda-sort)

(defun bh/agenda-sort (a b)
  "Sorting strategy for agenda items.
Late deadlines first, then scheduled, then non-late deadlines"
  (let (result num-a num-b)
    (cond
     ; time specific items are already sorted first by org-agenda-sorting-strategy

     ; non-deadline and non-scheduled items next
     ((bh/agenda-sort-test 'bh/is-not-scheduled-or-deadline a b))

     ; deadlines for today next
     ((bh/agenda-sort-test 'bh/is-due-deadline a b))

     ; late deadlines next
     ((bh/agenda-sort-test-num 'bh/is-late-deadline '< a b))

     ; scheduled items for today next
     ((bh/agenda-sort-test 'bh/is-scheduled-today a b))

     ; late scheduled items next
     ((bh/agenda-sort-test-num 'bh/is-scheduled-late '> a b))

     ; pending deadlines last
     ((bh/agenda-sort-test-num 'bh/is-pending-deadline '< a b))

     ; finally default to unsorted
     (t (setq result nil)))
    result))

(defmacro bh/agenda-sort-test (fn a b)
  "Test for agenda sort"
  `(cond
    ; if both match leave them unsorted
    ((and (apply ,fn (list ,a))
          (apply ,fn (list ,b)))
     (setq result nil))
    ; if a matches put a first
    ((apply ,fn (list ,a))
     (setq result -1))
    ; otherwise if b matches put b first
    ((apply ,fn (list ,b))
     (setq result 1))
    ; if none match leave them unsorted
    (t nil)))

(defmacro bh/agenda-sort-test-num (fn compfn a b)
  `(cond
    ((apply ,fn (list ,a))
     (setq num-a (string-to-number (match-string 1 ,a)))
     (if (apply ,fn (list ,b))
         (progn
           (setq num-b (string-to-number (match-string 1 ,b)))
           (setq result (if (apply ,compfn (list num-a num-b))
                            -1
                          1)))
       (setq result -1)))
    ((apply ,fn (list ,b))
     (setq result 1))
    (t nil)))
(defun bh/restrict-to-file-or-follow (arg)
  "Set agenda restriction to 'file or with argument invoke follow mode.
I don't use follow mode very often but I restrict to file all the time
so change the default 'F' binding in the agenda to allow both"
  (interactive "p")
  (if (equal arg 4)
      (org-agenda-follow-mode)
    (if (equal major-mode 'org-agenda-mode)
        (bh/set-agenda-restriction-lock 4)
      (widen))))
(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "F" 'bh/restrict-to-file-or-follow))
          'append)

(defun bh/narrow-to-org-subtree ()
  (widen)
  (org-narrow-to-subtree))

(defun bh/narrow-to-subtree ()
  (interactive)
  (if (equal major-mode 'org-agenda-mode)
      (org-with-point-at (org-get-at-bol 'org-hd-marker)
        (bh/narrow-to-org-subtree)
        (save-restriction
          (org-agenda-set-restriction-lock)))
    (bh/narrow-to-org-subtree)
    (save-restriction
      (org-agenda-set-restriction-lock))))

(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "N" 'bh/narrow-to-subtree))
          'append)

(defun bh/narrow-up-one-org-level ()
  (widen)
  (save-excursion
    (outline-up-heading 1 'invisible-ok)
    (bh/narrow-to-org-subtree)))

(defun bh/get-pom-from-agenda-restriction-or-point ()
  (or (org-get-at-bol 'org-hd-marker)
      (and (marker-position org-agenda-restrict-begin) org-agenda-restrict-begin)
      (and (equal major-mode 'org-mode) (point))
      org-clock-marker))

(defun bh/narrow-up-one-level ()
  (interactive)
  (if (equal major-mode 'org-agenda-mode)
      (org-with-point-at (bh/get-pom-from-agenda-restriction-or-point)
        (bh/narrow-up-one-org-level))
    (bh/narrow-up-one-org-level)))

(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "U" 'bh/narrow-up-one-level))
          'append)

(defun bh/narrow-to-org-project ()
  (widen)
  (save-excursion
    (bh/find-project-task)
    (bh/narrow-to-org-subtree)))

(defun bh/narrow-to-project ()
  (interactive)
  (if (equal major-mode 'org-agenda-mode)
      (org-with-point-at (bh/get-pom-from-agenda-restriction-or-point)
        (bh/narrow-to-org-project)
        (save-restriction
          (org-agenda-set-restriction-lock)))
    (bh/narrow-to-org-project)
    (save-restriction
      (org-agenda-set-restriction-lock))))

(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "P" 'bh/narrow-to-project))
          'append)

(defvar bh/current-view-project nil)

(defun bh/view-next-project ()
  (interactive)
  (unless (marker-position org-agenda-restrict-begin)
    (goto-char (point-min))
    (setq bh/current-view-project (point)))
  (bh/widen)
  (goto-char bh/current-view-project)
  (forward-visible-line 1)
  (while (and (< (point) (point-max))
              (or (not (org-get-at-bol 'org-hd-marker))
                  (org-with-point-at (org-get-at-bol 'org-hd-marker)
                    (or (not (bh/is-project-p))
                        (bh/is-project-subtree-p)))))
    (forward-visible-line 1))
  (setq bh/current-view-project (point))
  (if (org-get-at-bol 'org-hd-marker)
      (progn
        (bh/narrow-to-project)
        (org-agenda-redo)
        (beginning-of-buffer))
    (beginning-of-buffer)
    (error "All projects viewed.")))

(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "V" 'bh/view-next-project))
          'append)
(defun bh/clock-in-task-by-id (id)
  "Clock in a task by id"
  (org-with-point-at (org-id-find id 'marker)
    (org-clock-in nil)))

(defun bh/clock-in-last-task (arg)
  "Clock in the interrupted task if there is one
Skip the default task and get the next one.
A prefix arg forces clock in of the default task."
  (interactive "p")
  (let ((clock-in-to-task
         (cond
          ((eq arg 4) org-clock-default-task)
          ((and (org-clock-is-active)
                (equal org-clock-default-task (cadr org-clock-history)))
           (caddr org-clock-history))
          ((org-clock-is-active) (cadr org-clock-history))
          ((equal org-clock-default-task (car org-clock-history)) (cadr org-clock-history))
          (t (car org-clock-history)))))
    (widen)
    (org-with-point-at clock-in-to-task
      (org-clock-in nil))))

(defun bh/mark-next-parent-tasks-todo ()
  "Visit each parent task and change NEXT states to TODO"
  (let ((mystate (or (and (fboundp 'org-state)
                          state)
                     (nth 2 (org-heading-components)))))
    (when (equal mystate "NEXT")
      (save-excursion
        (while (org-up-heading-safe)
          (when (member (nth 2 (org-heading-components)) (list "NEXT"))
            (org-todo "TODO")))))))
(defun bh/clock-in-task-by-id (id)
  "Clock in a task by id"
  (org-with-point-at (org-id-find id 'marker)
    (org-clock-in nil)))

(defun bh/clock-in-last-task (arg)
  "Clock in the interrupted task if there is one
Skip the default task and get the next one.
A prefix arg forces clock in of the default task."
  (interactive "p")
  (let ((clock-in-to-task
         (cond
          ((eq arg 4) org-clock-default-task)
          ((and (org-clock-is-active)
                (equal org-clock-default-task (cadr org-clock-history)))
           (caddr org-clock-history))
          ((org-clock-is-active) (cadr org-clock-history))
          ((equal org-clock-default-task (car org-clock-history)) (cadr org-clock-history))
          (t (car org-clock-history)))))
    (widen)
    (org-with-point-at clock-in-to-task
      (org-clock-in nil))))

(defun bh/mark-next-parent-tasks-todo ()
  "Visit each parent task and change NEXT states to TODO"
  (let ((mystate (or (and (fboundp 'org-state)
                          state)
                     (nth 2 (org-heading-components)))))
    (when (equal mystate "NEXT")
      (save-excursion
        (while (org-up-heading-safe)
          (when (member (nth 2 (org-heading-components)) (list "NEXT"))
            (org-todo "TODO")))))))

;; Custom agenda command definitions
(setq org-agenda-custom-commands
      (quote (("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              ("h" "Habits" tags-todo "STYLE=\"habit\""
               ((org-agenda-overriding-header "Habits")
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              (" " "Agenda"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Tasks to Refile")
                       (org-tags-match-list-sublevels nil)))
                (tags-todo "-HOLD-CANCELLED/!"
                           ((org-agenda-overriding-header "Projects")
                            (org-agenda-skip-function 'bh/skip-non-projects)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED/!"
                           ((org-agenda-overriding-header "Stuck Projects")
                            (org-agenda-skip-function 'bh/skip-non-stuck-projects)))
                (tags-todo "-WAITING-CANCELLED/!NEXT"
                           ((org-agenda-overriding-header "Next Tasks")
                            (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                            (org-agenda-todo-ignore-scheduled t)
                            (org-agenda-todo-ignore-deadlines t)
                            (org-agenda-todo-ignore-with-date t)
                            (org-tags-match-list-sublevels t)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))
                (tags-todo "-REFILE-CANCELLED/!-HOLD-WAITING"
                           ((org-agenda-overriding-header "Tasks")
                            (org-agenda-skip-function 'bh/skip-project-tasks-maybe)
                            (org-agenda-todo-ignore-scheduled t)
                            (org-agenda-todo-ignore-deadlines t)
                            (org-agenda-todo-ignore-with-date t)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED+WAITING/!"
                           ((org-agenda-overriding-header "Waiting and Postponed Tasks")
                            (org-agenda-skip-function 'bh/skip-stuck-projects)
                            (org-tags-match-list-sublevels nil)
                            (org-agenda-todo-ignore-scheduled 'future)
                            (org-agenda-todo-ignore-deadlines 'future)))
                )
               nil)
              ("r" "Tasks to Refile" tags "REFILE"
               ((org-agenda-overriding-header "Tasks to Refile")
                (org-tags-match-list-sublevels nil)))
              ("#" "Stuck Projects" tags-todo "-CANCELLED/!"
               ((org-agenda-overriding-header "Stuck Projects")
                (org-agenda-skip-function 'bh/skip-non-stuck-projects)))
              ("n" "Next Tasks" tags-todo "-WAITING-CANCELLED/!NEXT"
               ((org-agenda-overriding-header "Next Tasks")
                (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                (org-agenda-todo-ignore-scheduled t)
                (org-agenda-todo-ignore-deadlines t)
                (org-agenda-todo-ignore-with-date t)
                (org-tags-match-list-sublevels t)
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              ("R" "Tasks" tags-todo "-REFILE-CANCELLED/!-HOLD-WAITING"
               ((org-agenda-overriding-header "Tasks")
                (org-agenda-skip-function 'bh/skip-project-tasks-maybe)
                (org-agenda-sorting-strategy
                 '(category-keep))))
              ("p" "Projects" tags-todo "-HOLD-CANCELLED/!"
               ((org-agenda-overriding-header "Projects")
                (org-agenda-skip-function 'bh/skip-non-projects)
                (org-agenda-sorting-strategy
                 '(category-keep))))
              ("w" "Waiting Tasks" tags-todo "-CANCELLED+WAITING/!"
               ((org-agenda-overriding-header "Waiting and Postponed tasks"))
               (org-tags-match-list-sublevels nil))
              ("d" "default tasks" tags "default" 
                ((org-agenda-overriding-header "Default Tasks")))
              ("A" "Tasks to Archive" tags "-REFILE/"
               ((org-agenda-overriding-header "Tasks to Archive")
                (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                (org-tags-match-list-sublevels nil))))))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING" . t) ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

;; Use IDO for target completion
(setq org-completion-use-ido t)
;; Targets include this file and any file contributing to the agenda - up to 5 levels deep
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 5) (nil :maxlevel . 5))))
;; Targets start with the file name - allows creating level 1 tasks
(setq org-refile-use-outline-path (quote file))
;; Targets complete in steps so we start with filename, TAB shows the next level of targets etc
(setq org-outline-path-complete-in-steps t)
;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)
;;
;; Show lot sof clocking history so it's easy to pick items off the C-F11 list
(setq org-clock-history-length 36)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; Change tasks to NEXT when clocking in
(setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
;; Save clock data and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)
;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)
;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)
;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)

(setq bh/keep-clock-running nil)
(setq org-startup-folded t)
;; Show all future entries for repeating tasks
(setq org-agenda-repeating-timestamp-show-all t)

;; Show all agenda dates - even if they are empty
(setq org-agenda-show-all-dates t)

;; Sorting order for tasks on the agenda
(setq org-agenda-sorting-strategy
      (quote ((agenda habit-down time-up user-defined-up priority-down effort-up category-keep)
              (todo category-up priority-down effort-up)
              (tags category-up priority-down effort-up)
              (search category-up))))

;; Start the weekly agenda on Monday
(setq org-agenda-start-on-weekday 1)
;; Enable display of the time grid so we can see the marker for the current time
(setq org-agenda-time-grid (quote ((daily today remove-match)
                                   #("----------------" 0 16 (org-heading t))
                                   (830 1000 1200 1300 1500 1700))))
;; Display tags farther right
(setq org-agenda-tags-column -102)
;; Dim blocked tasks
(setq org-agenda-dim-blocked-tasks t)

;; Compact the block agenda view
(setq org-agenda-compact-blocks t)
; position the habit graph on the agenda to the right of the default
(setq org-habit-graph-column 50)
(setq org-stuck-projects (quote ("" nil nil "")))
(declare-function org-is-habit-p "org-habit" (&optional pom))

; eshell in jedem fall beenden
(defun kills() (interactive) (org-mode)(kill-buffer))
