

;;(define-key global-map "\C-ö" nil)
;;(global-set-key "\C-ö\C-e" 'find-file)
;;(define-key global-map "\C-ö" (kbd "C-x"))
;;(define-key global-map "\C-ö\C-e" 'find-file)
;;(define-key global-map "\M-o" ')

(defun frame-bck()
  (interactive)
  (other-window -1)
)
(define-key (current-global-map) (kbd "M-n") 'other-window)
(define-key (current-global-map) (kbd "M-N") 'frame-bck)
(define-key (current-global-map) (kbd "M-m") 'helm-mini)
(define-key (current-global-map) (kbd "M-e") 'evil-normal-state)
(define-key (current-global-map) (kbd "M-e") 'keyboard-quit)

;;(define-key global-map (kbd "C-u 
;;(key-key global-map (kbd "C-ö

;; (define-key global-map (kbd "M-x") 'find-file)

(savehist-mode t)
(global-set-key "\C-x\C-r" 'recentf-open-most-recent-file)
(recentf-mode 1)
(provide 'custm-emac-keys)
