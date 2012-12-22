(require 'bookmark)
  (setq enable-recursive-minibuffers t)
  (define-key ido-file-dir-completion-map [(meta control ?b)] 'ido-goto-bookmark)

(defun ido-goto-bookmark (bookmark)
    (interactive
     (list (bookmark-completing-read "Jump to bookmark"
      				   bookmark-current-bookmark)))
    (unless bookmark
      (error "No bookmark specified"))
    (let ((filename (bookmark-get-filename bookmark)))
      (if (file-directory-p filename)
  	(progn
  	  (ido-set-current-directory filename)
  	  (setq ido-text ""))
        (progn
  	(ido-set-current-directory (file-name-directory filename))))
      (setq ido-exit        'refresh
  	  ido-text-init   ido-text
  	  ido-rotate-temp t)
      (exit-minibuffer)))


(provide 'ido-bookmark)
