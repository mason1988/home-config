(require 'evil-maps)

(define-key evil-normal-state-map "u" 'evil-append)
(define-key evil-normal-state-map "U" 'evil-append-line)
(define-key evil-normal-state-map "ä" 'evil-change)
(define-key evil-normal-state-map "Ä" 'evil-change-line)
(define-key evil-normal-state-map "a" 'evil-delete)
(define-key evil-normal-state-map "A" 'evil-delete-line)
(define-key evil-normal-state-map "g" 'evil-insert)
(define-key evil-normal-state-map "G" 'evil-insert-line)
(define-key evil-normal-state-map "N" 'evil-join)
(define-key evil-normal-state-map "m" 'evil-set-marker)
(define-key evil-normal-state-map "f" 'evil-open-below)
(define-key evil-normal-state-map "F" 'evil-open-above)
(define-key evil-normal-state-map "q" 'evil-paste-after)
(define-key evil-normal-state-map "Q" 'evil-paste-before)
(define-key evil-normal-state-map "x" 'evil-record-macro)
(define-key evil-normal-state-map "c" 'evil-replace)
(define-key evil-normal-state-map "C" 'evil-replace-state)
(define-key evil-normal-state-map "i" 'evil-substitute)
(define-key evil-normal-state-map "I" 'evil-change-whole-line)
(define-key evil-normal-state-map "ö" 'evil-delete-char)
(define-key evil-normal-state-map "Ö" 'evil-delete-backward-char)
(define-key evil-normal-state-map "ü" 'evil-yank)
(define-key evil-normal-state-map "Ü" 'evil-yank-line)

(define-key evil-normal-state-map "o" nil)
(define-key evil-normal-state-map "k" nil)

(global-set-key "\M-e" 'evil-force-normal-state)

(define-key evil-normal-state-map "o&" 'evil-ex-repeat-global-substitute)
(define-key evil-normal-state-map "o8" 'what-cursor-position)
(define-key evil-normal-state-map "ou" 'what-cursor-position)
(define-key evil-normal-state-map "og" 'evil-insert-resume)
(define-key evil-normal-state-map "oN" 'evil-join-whitespace)
(define-key evil-normal-state-map "ox" 'evil-fill-and-move)
(define-key evil-normal-state-map "ov" 'evil-fill)
(define-key evil-normal-state-map "oh" 'evil-downcase)
(define-key evil-normal-state-map "oH" 'evil-upcase)
(define-key evil-normal-state-map "oe" 'find-file-at-point)
(define-key evil-normal-state-map "oE" 'evil-find-file-at-point-with-line)
(define-key evil-normal-state-map "o?" 'evil-rot13)
(define-key evil-normal-state-map "o~" 'evil-invert-case)
(define-key evil-normal-state-map "kf" 'evil-open-fold)
(define-key evil-normal-state-map "kn" 'evil-close-fold)
(define-key evil-normal-state-map "ku" 'evil-toggle-fold)
(define-key evil-normal-state-map "kc" 'evil-open-folds)
(define-key evil-normal-state-map "km" 'evil-close-folds)

(define-key evil-normal-state-map "\C-b" 'evil-paste-pop-next)
(define-key evil-normal-state-map "\C-q" 'evil-paste-pop)
(define-key evil-normal-state-map "\C-w" 'pop-tag-mark)
(define-key evil-normal-state-map (kbd "C-.") 'evil-repeat-pop)
(define-key evil-normal-state-map (kbd "M-.") 'evil-repeat-pop-next)

(define-key evil-normal-state-map "KK" 'evil-save-modified-and-close)
(define-key evil-normal-state-map "KX" 'evil-quit)

(define-key evil-normal-state-map "o;" 'goto-last-change)
(define-key evil-normal-state-map "o," 'goto-last-change-reverse)

(define-key evil-normal-state-map "h" 'undo)

(when (fboundp 'undo-tree-undo)
  (define-key evil-normal-state-map "h" 'undo-tree-undo)
  (define-key evil-normal-state-map "\C-c" 'undo-tree-redo))
;;;;;;;;;;;;;;;;;;;;normale state ende

(define-key evil-motion-state-map "o" nil)
(define-key evil-motion-state-map "k" nil)

(define-key evil-motion-state-map "z" 'evil-backward-word-begin)
(define-key evil-motion-state-map "Z" 'evil-backward-WORD-begin)
(define-key evil-motion-state-map "l" 'evil-forward-word-end)
(define-key evil-motion-state-map "L" 'evil-forward-WORD-end)
(define-key evil-motion-state-map "e" 'evil-find-char)
(define-key evil-motion-state-map "E" 'evil-find-char-backward)
(define-key evil-motion-state-map "O" 'evil-goto-line)
(define-key evil-motion-state-map "s" 'evil-backward-char)
(define-key evil-motion-state-map "S" 'evil-window-top)
(define-key evil-motion-state-map "n" 'evil-next-line)
(define-key evil-motion-state-map "r" 'evil-previous-line)
(define-key evil-motion-state-map "t" 'evil-forward-char)

(define-key evil-motion-state-map "R" 'evil-lookup)
(define-key evil-motion-state-map "T" 'evil-window-bottom)
(define-key evil-motion-state-map "M" 'evil-window-middle)
(define-key evil-motion-state-map "b" 'evil-search-next)
(define-key evil-motion-state-map "B" 'evil-search-previous)
(define-key evil-motion-state-map "w" 'evil-find-char-to)
(define-key evil-motion-state-map "W" 'evil-find-char-to-backward)
(define-key evil-motion-state-map "v" 'evil-forward-word-begin)
(define-key evil-motion-state-map "V" 'evil-forward-WORD-begin)
(define-key evil-motion-state-map "oa" 'evil-goto-definition)
(define-key evil-motion-state-map "ol" 'evil-backward-word-end)
(define-key evil-motion-state-map "oL" 'evil-backward-WORD-end)
(define-key evil-motion-state-map "oo" 'evil-goto-first-line)
(define-key evil-motion-state-map "on" 'evil-next-visual-line)
(define-key evil-motion-state-map "or" 'evil-previous-visual-line)
(define-key evil-motion-state-map "o0" 'evil-beginning-of-visual-line)
(define-key evil-motion-state-map "o_" 'evil-last-non-blank)
(define-key evil-motion-state-map "o^" 'evil-first-non-blank-of-visual-line)
(define-key evil-motion-state-map "o$" 'evil-end-of-visual-line)
(define-key evil-motion-state-map "o\C-]" 'find-tag)

(define-key evil-motion-state-map "\C-v" 'evil-window-map)

(define-key evil-motion-state-map (kbd "C-z") 'evil-scroll-page-up)
(define-key evil-motion-state-map (kbd "C-a") 'evil-scroll-down)
(define-key evil-motion-state-map (kbd "C-l") 'evil-scroll-line-down)
(define-key evil-motion-state-map (kbd "C-e") 'evil-scroll-page-down)
(define-key evil-motion-state-map (kbd "C-f") 'evil-jump-backward)
(define-key evil-motion-state-map (kbd "C-ü") 'evil-scroll-line-up)

(define-key evil-motion-state-map "k^" 'evil-scroll-top-line-to-bottom)
(define-key evil-motion-state-map "k+" 'evil-scroll-bottom-line-to-top)
(define-key evil-motion-state-map "kw" 'evil-scroll-line-to-top)

(define-key evil-motion-state-map (vconcat "k" [return]) "kw^")
(define-key evil-motion-state-map (kbd "k RET") (vconcat "k" [return]))
(define-key evil-motion-state-map "kk" 'evil-scroll-line-to-center)
(define-key evil-motion-state-map "k." "kk^")
(define-key evil-motion-state-map "kz" 'evil-scroll-line-to-bottom)
(define-key evil-motion-state-map "k-" "kz^")
(define-key evil-motion-state-map "p" 'evil-visual-char)
(define-key evil-motion-state-map "P" 'evil-visual-line)
(define-key evil-motion-state-map "\C-p" 'evil-visual-block)
(define-key evil-motion-state-map "op" 'evil-visual-restore)

;;;;; ende evil motion state

;;; Visual state

(define-key evil-visual-state-map "U" 'evil-append)
(define-key evil-visual-state-map "G" 'evil-insert)
(define-key evil-visual-state-map "f" 'exchange-point-and-mark)
(define-key evil-visual-state-map "F" 'evil-visual-exchange-corners)
(define-key evil-visual-state-map "C" 'evil-change)
(define-key evil-visual-state-map "h" 'evil-downcase)
(define-key evil-visual-state-map "H" 'evil-upcase)
(define-key evil-visual-state-map "u" evil-outer-text-objects-map)
(define-key evil-visual-state-map "g" evil-inner-text-objects-map)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; outer/inner text
(define-key evil-outer-text-objects-map "v" 'evil-a-word)
(define-key evil-outer-text-objects-map "V" 'evil-a-WORD)
(define-key evil-outer-text-objects-map "i" 'evil-a-sentence)
(define-key evil-outer-text-objects-map "q" 'evil-a-paragraph)
(define-key evil-outer-text-objects-map "z" 'evil-a-paren)

(define-key evil-outer-text-objects-map "Z" 'evil-a-curly)
(define-key evil-inner-text-objects-map "Z" 'evil-inner-curly)

(define-key evil-outer-text-objects-map "w" 'evil-a-tag)
(define-key evil-inner-text-objects-map "v" 'evil-inner-word)
(define-key evil-inner-text-objects-map "V" 'evil-inner-WORD)
(define-key evil-inner-text-objects-map "i" 'evil-inner-sentence)
(define-key evil-inner-text-objects-map "q" 'evil-inner-paragraph)
(define-key evil-inner-text-objects-map "z" 'evil-inner-paren)

(define-key evil-inner-text-objects-map "w" 'evil-inner-tag)

;;; extras
(define-key evil-normal-state-map "M-e" 'evil-force-normal-state)


;;; Operator Pending state
(define-key evil-operator-state-map "u" evil-outer-text-objects-map)
(define-key evil-operator-state-map "g" evil-inner-text-objects-map)


(provide 'new-keys)