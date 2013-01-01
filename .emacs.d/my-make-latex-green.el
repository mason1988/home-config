(defun my-make-latex-green ()
  "Convert Region to a Latex image (white font)"
  (interactive)
  (setq filename
	(concat
	 (make-temp-name
	  (concat 
		  ""
		  (format-time-string "%Y%mad-%H%M%S")))""))

  (setq stuff (buffer-substring (region-beginning)(region-end)))
  
  (with-temp-buffer
    
    (insert (string-as-multibyte "\\documentclass[11pt]{standalone}"))
    (insert (string-as-multibyte "\\usepackage[utf8]{inputenc}"))
    (insert (string-as-multibyte "\\usepackage{amssymb, amsmath}"))
    (insert (string-as-multibyte "\\begin {document}"))
    (insert (string-as-multibyte "$"))

    (insert stuff)

    (insert (string-as-multibyte "$"))
    (insert (string-as-multibyte "\\end{document}"))

    (write-region (point-min)(point-max) (concat filename ".tex"))
    
;  (call-process
;   "latex" nil "*scratch*" nil
;	 (concat filename ".tex"))
    (shell-command
     (concat "latex " filename ".tex"))

;  (call-process
;   "dvipng" nil "*scratch*" nil
;   (concat filename ".dvi -o " filename ".png"))
    (shell-command
     (concat "dvipng " filename ".dvi -bg 'Transparent' -fg 'rgb 0.0 1.0 0.0' -o " filename ".png"))

    (shell-command
     (concat "rm " filename ".tex"))
    (shell-command
     (concat "rm " filename ".dvi"))
    (shell-command
     (concat "rm " filename ".log"))
    (shell-command
     (concat "rm " filename ".aux"))
  )
  
  
  (kill-buffer "*Shell Command Output*")
  (goto-char (region-beginning))
  
  (insert (concat "[[file:" filename ".png]]\n"))
  (org-display-inline-images)
)
(provide 'my-make-latex-green)

