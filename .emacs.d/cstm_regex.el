(defun cstmRegexNextManager () (interactive)
  (cond ((not (boundp 'cstm-regex-last-pos)) (call-interactively 'cstmRegexNextAsk))
	((not (equal (point) cstm-regex-last-pos)) (call-interactively 'cstmRegexNextAsk))
	( (cstmRegexNextCore cstm-regex-last-search))))

(defun cstmRegexNextAsk (ausdruck)
  (interactive "sSuchausdruck: ")
  (cstmRegexNextCore ausdruck))

(defun cstmRegexNextCore (ausdruck)
  (setq cstm-regex-last-pos 0
	cstm-regex-last-search "0")
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
	       (setq cstm-regex-last-pos (point))
	       (setq cstm-regex-last-search ausdruck)
	       ))))))

(defun cstmRegexPrevManager () (interactive)
  (cond ((not (boundp 'cstm-regex-last-pos)) (call-interactively 'cstmRegexPrevAsk))
	((not (equal (point) cstm-regex-last-pos)) (call-interactively 'cstmRegexPrevAsk))
	((1 (cstmRegexPrevCore cstm-regex-last-search)))))

(defun cstmRegexPrevAsk (ausdruck)
  (interactive "sSuchausdruck: ")
  (cstmRegexPrevCore ausdruck))

(defun cstmRegexPrevCore (ausdruck)
  (setq cstm-regex-last-pos 0
	cstm-regex-last-search "0")
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
	      (message "no matching lines found")
	      )

	    (setq var1 (buffer-substring-no-properties p1 p2))
	    (when (string-match ausdruck var1)
	       (message var1)
	       (setq moreLines (< 2 1))
	       (setq cstm-regex-last-pos (point))
	       (setq cstm-regex-last-search ausdruck)
	       ))))))

(provide 'cstm_regex)
