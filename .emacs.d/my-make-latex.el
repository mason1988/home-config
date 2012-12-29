(defun my-make-latex ()
  "Convert Region to a Latex image"
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

    (write-region (point-min)(point-max) (concat filename ".tex")))
    
  (shell-command
   (concat "latex " filename ".tex"))

  (shell-command
   (concat "dvipng " filename ".dvi -o " filename ".png"))

  (insert (concat "\n [[file:" filename ".png]]\n"))
  (iimage-recenter)
)
(provide 'my-make-latex)

