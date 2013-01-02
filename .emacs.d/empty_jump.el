(defun jumpToNextEmpty ()
  (interactive)
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
	      (message "no further empty lines!")
	      )

	    (setq var1 (buffer-substring-no-properties p1 p2))
	    (when (string-match "^[ \t]*$" var1)
	       (message var1)
	       (setq moreLines (< 2 1))
	       )
	   )
	 )

       )
    )
 )


(defun jumpToPrevEmpty ()
  (interactive)
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
	    (when (string-match "^[ \t]*$" var1)
	       (message var1)
	       (setq moreLines (< 2 1))
	       )
	   )
	 )
       )
    )
 )



(provide 'empty_jump)
