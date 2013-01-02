(defun forward-and-preview ()
    (interactive)
    "Go to same level next heading and show preview in dedicated buffer"
    (hide-subtree)
    (org-speed-move-safe (quote outline-next-visible-heading))
    (show-children)
    (org-tree-to-indirect-buffer)
    )
(defun back-and-preview ()
    "Go to same level previous heading and show preview in dedicated buffer"
    (hide-subtree)
    (org-speed-move-safe (quote outline-previous-visible-heading))
    (show-children)
    (org-tree-to-indirect-buffer)
    )
(defun up-back-and-preview ()
    "Go to previous level heading and show preview in dedicated buffer"
    (org-speed-move-safe (quote outline-up-heading))
    (org-tree-to-indirect-buffer)
    (hide-subtree)
    )
(defun up-forward-and-preview ()
    "Go to previous level next heading and show preview in dedicated buffer"
    (org-speed-move-safe (quote outline-up-heading))
    (hide-subtree)
    (org-speed-move-safe (quote outline-next-visible-heading))
    (org-tree-to-indirect-buffer)
    )
(defun inside-and-preview ()
    "Go to next level heading and show preview in dedicated buffer"
    (org-speed-move-safe (quote outline-next-visible-heading))
    (show-children)
    (org-tree-to-indirect-buffer)
    )
(add-to-list 'org-speed-commands-user '("l" inside-and-preview))
(add-to-list 'org-speed-commands-user '("j" forward-and-preview))
(add-to-list 'org-speed-commands-user '("k" back-and-preview))
(add-to-list 'org-speed-commands-user '("J" up-forward-and-preview))
(add-to-list 'org-speed-commands-user '("K" up-back-and-preview))

(defun jump-head-up-wrapper ()
  (interactive)

  (let (var1 startpoint)
  (setq var1 (buffer-substring-no-properties
	      (line-beginning-position)
	      (line-end-position)))

  (setq startpoint (point))
  
  (if (string-match "^\*" var1)

    (outline-up-heading 1)        ;falls stern am anfang, nix tun
    
    (let (finished)
      (setq finished nil)
    (while (not finished)
      (next-line -1)
       
      (when (<= (line-beginning-position) 1)
	 (goto-char startpoint)
	 (message "no further mathing lines")
	 (setq finished t)
	 )

      (setq var1 (buffer-substring-no-properties
	      (line-beginning-position)
	      (line-end-position)))
      (setq finished (string-match "^\*" var1))
 ))))) 

(define-key (current-global-map) [remap outline-up-heading] 'jump-head-up-wrapper)

(provide 'org-nav)
