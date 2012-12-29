(defun jump-vert-up ()
  (interactive)

  (let (startpoint start_hor)

  (setq start_hor (- (point) (line-beginning-position)))
  (setq startpoint (point))


  ;check ob passt
      (let (finished)
      (setq finished nil)
      
    (while (not finished)
      (evil-previous-line)
      ;(forward-line -1)
      ;(next-line -1)

      
      (when (>= (- (line-end-position) (line-beginning-position)) start_hor)
	 (setq finished t)
	 (goto-char (+ (line-beginning-position) start_hor)))

      (when (<= (line-beginning-position) 1)
	 (goto-char startpoint)
	(message "no further matching lines")
	 (setq finished t)
	 )
)))) 
 
(defun jump-vert-down ()
  (interactive)

  (let (startpoint start_hor)

  (setq start_hor (- (point) (line-beginning-position)))
  (setq startpoint (point))


  ;check ob passt
      (let (finished)
      (setq finished nil)
      
    (while (not finished)
      (evil-next-line)
      ;(forward-line -1)
      ;(next-line -1)

      
      (when (>= (- (line-end-position) (line-beginning-position)) start_hor)
	 (setq finished t)
	 (goto-char (+ (line-beginning-position) start_hor)))

      (when (>= (line-end-position) (buffer-size))
	 (goto-char startpoint)
	(message "no further matching lines")
	 (setq finished t)
	 )
))))

(provide 'naviplus)
