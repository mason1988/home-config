;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

;; TODO:  - Zeile aus der kopiert wird, hervorheben
;;        - möglichkeit bieten, Quellzeile weiter zu verschieben
;;     

(defun clean_regex (reg)  ;saver
       (replace-regexp-in-string "\\]" "\\\\]"
       (replace-regexp-in-string "\\*" "\\\\*"
       (replace-regexp-in-string "\\+" "\\\\+"
       (replace-regexp-in-string "\\[" "\\\\["
       (replace-regexp-in-string "\\\\" "\\\\\\\\"
        reg))))))

(defun flosub() (interactive)
  (if (not (boundp 'flosub-exp-end))   ;falls noch nichts zum extenden da ist
      (call-interactively 'flosub-prev)
    (if (equal (point) flosub-exp-end) (call-interactively 'flosub-extend-end)
      (call-interactively 'flosub-prev))))

(defun flosub-prev (end) (interactive "sEnd-String: ")
  (if
      (region-active-p)
      (let ()
	(setq flosub-exp-st (region-beginning))
	(setq flosub-exp-end (region-end)))
    (let ()
      (setq flosub-exp-end (point))
      (search-backward-regexp "[\n ]")
      (setq flosub-exp-st (+ (point) 1))
      (forward-char)))
  
    (setq start (buffer-substring-no-properties flosub-exp-st flosub-exp-end))
    (setq flosub-sub-str-st (clean_regex start)
	  flosub-sub-str-end (clean_regex end)    ;start and end of search strings
	  flosub-tar-st 0
	  flosub-tar-end 0)                       ;start and end of found occurence (target)

    (save-excursion
      (search-backward-regexp
        (concat flosub-sub-str-st ".*" flosub-sub-str-end))

      (when (>= (point) flosub-exp-st) (message "Rekursion gestoppt") (throw 'foo t))
      
      (setq flosub-tar-st (point))
      (setq flosub-tar-end (search-forward-regexp flosub-sub-str-end))
	
      (setq flosub-tar-str (buffer-substring  flosub-tar-st flosub-tar-end)))

    (delete-region flosub-exp-st flosub-exp-end)
    (setq flosub-exp-st (point))
    (insert flosub-tar-str)
    (setq flosub-exp-end (point)))

(defun flosub-extend-end() (interactive)
  (let (saver)
    (setq saver t)
    (save-excursion
      (goto-char (+ flosub-tar-end))
      (setq flosub-tmp-tar-end (search-forward-regexp flosub-sub-str-end))
      (when (>= (point) flosub-exp-st) (message "Rekursion gestoppt") (throw 'foo t))
      (when (> (- flosub-tmp-tar-end flosub-tar-end) 200)
	(if (y-or-n-p "Es werden über 200 Zeichen gesprungen. Weitermachen?")
	    (progn (message "abegbrochen"))
	  (progn (setq saver nil))))
      )

    (when saver
      (setq flosub-tar-end flosub-tmp-tar-end)
      (setq flosub-tar-str (buffer-substring flosub-tar-st flosub-tar-end))
      (delete-region flosub-exp-st flosub-exp-end)
      (setq flosub-exp-st (point))
      (insert flosub-tar-str)
      (setq flosub-exp-end (point)))))

(provide 'flosub)
