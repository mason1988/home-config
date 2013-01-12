(require 'org-install)

(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (setq filename
        (concat
         (make-temp-name
          (concat (buffer-file-name)
                  "_"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (call-process "import" nil nil nil filename)
  (insert (concat "[[" filename "]]"))
  (iimage-recenter))

(defun my-org-screenshot2 ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (setq filename
        (concat
         (make-temp-name
          (concat (buffer-file-name)
                  "_"
                  (format-time-string "%Y%m%d_%H%M%S_")) )))

 (save-window-excursion
   (with-temp-buffer
  (shell-command (concat "python ~/coding/screenshot-tool.py " (concat filename ".png")))))

 (if (file-exists-p (concat filename "-" (number-to-string 0) ".png"))
   (load-sliced-images filename)
   (insert (concat "[[" filename ".png" "]]")))
 (org-display-inline-images))

(defun load-sliced-images(filename)
(let ((i 0))
  (while (< i 100)
    (if (file-exists-p (concat filename "-" (number-to-string i) ".png"))
      (insert (concat "[[" (concat filename "-" (number-to-string i) ".png" "]]\n")))
      (setq i 100))
    (setq i (+ i 1)))))

(provide 'my-org-screenshot)
