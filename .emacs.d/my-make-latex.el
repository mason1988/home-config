(defun my-make-latex-core (conv_par kill_f)
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
    
    (shell-command
     (concat "latex " filename ".tex"))

    (shell-command
     (concat "dvipng " filename ".dvi " conv_par " -o " filename ".png"))

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

  (if kill_f
    (let ()
	 (delete-region (region-beginning) (region-end))
	 (insert (concat "[[file:" filename ".png]]")))
    (let ()
         (goto-char (region-beginning))
         (insert (concat "[[file:" filename ".png]]\n"))))

  (org-display-inline-images)
)

(defun my-make-latex
  (interactive)
  (my-make-latex-core "-bg 'Transparent'" nil))
(defun my-make-latex-inverse ()
  "Convert Region to a Latex image (white font)"
  (interactive)
   (my-make-latex-core "-bg 'Transparent' -fg 'rgb 1.0 1.0 1.0'" nil))
(defun my-make-latex-green ()
  "Convert Region to a Latex image (white font)"
  (interactive)
   (my-make-latex-core "-bg 'Transparent' -fg 'rgb 0.0 1.0 0.0'" nil))
(defun my-make-latex-replace ()
  (interactive)
   (my-make-latex-core "-bg 'Transparent'" 't))
(provide 'my-make-latex)
