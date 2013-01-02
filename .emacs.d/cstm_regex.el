(defun cstmRegexNext (ausdruck)
  (interactive "sSuchausdruck: ")
  (let (var1 moreLines startpoint)
    (setq moreLines (> 2 1))
    (setq startpoint (point))
    (while moreLines
       (if moreLines
	  (let (p1 p2)
	    (next-line 1)
	    (setq p1 (line-beginning-position))
	    (setq p2 (line-end-position))

	    (when (>= p2 (buffer-size))
	      (setq moreLines (< 2 1))
	      (goto-char startpoint)
	      (message "no matching lines found")
	      )

	    (setq var1 (buffer-substring-no-properties p1 p2))
	    (when (string-match ausdruck var1)
	       (message var1)
	       (setq moreLines (< 2 1))
	       )
	   )
	 )
       )
    )
 
)

(defun cstmRegexPrev (ausdruck)
  (interactive "sSuchausdruck: ")
  (let (var1 moreLines startpoint)
    (setq moreLines (> 2 1))
    (setq startpoint (point))
    (while moreLines
       (if moreLines
	  (let (p1 p2)
	    (next-line -1)
	    (setq p1 (line-beginning-position))
	    (setq p2 (line-end-position))

	    (when (<= p1 1)
	      (setq moreLines (< 2 1))
	      (goto-char startpoint)
	      (message "no empty lines found")
	      )

	    (setq var1 (buffer-substring-no-properties p1 p2))
	    (when (string-match ausdruck var1)
	       (message var1)
	       (setq moreLines (< 2 1))
	       )
	   )
	 )
       )
    )
 
)

(provide 'cstm_regex)
