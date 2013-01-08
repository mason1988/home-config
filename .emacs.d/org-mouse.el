(defadvice dnd-insert-text (around org-mouse-dnd-insert-text activate)
  (if (eq major-mode 'org-mode)
      (progn
	(cond
	 ;; if this is the end of the line then just insert text here
	 ((eolp)
	  (skip-chars-backward " \t")
	  (kill-region (point) (point-at-eol))
	  (unless (looking-back ":") (insert ":"))
	  (insert " "))
	
	 ;; if this is the beginning of the line then insert before
	 ((and (looking-at " \\|\t")	
	       (save-excursion
		 (skip-chars-backward " \t") (bolp)))
	  (beginning-of-line)
	  (looking-at "[ \t]*")
	  (open-line 1)
	  (indent-to (- (match-end 0) (match-beginning 0)))
	  (insert "+ "))
	
	 ;; if this is a middle of the line, then insert after
	 (t
	  (end-of-line)
	  (newline t)
	  (indent-relative)
	  (insert "+ ")))
	(insert text)
	(beginning-of-line))
    ad-do-it))
(provide 'org-mouse)
