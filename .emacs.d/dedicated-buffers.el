(defun dedi_func ()
  "makes currently selected window strongly dedicated to its buffer"
  (interactive)
  (set-window-dedicated-p (frame-selected-window) t)
  (message "window dedicated!"))
(defun undedi_func ()
  "removes dedication from currently selected window"
  (interactive)
  (set-window-dedicated-p (frame-selected-window) nil)
  (message "window undedicated!"))
(provide 'dedicated-buffers)
