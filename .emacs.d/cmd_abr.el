(evil-ex-define-cmd "refi" 'recentf-open-files)
(evil-ex-define-cmd "lofi" 'load-file)
(evil-ex-define-cmd "fifi" 'find-file)
(evil-ex-define-cmd "ewh" 'enlarge-window-horizontally)
(evil-ex-define-cmd "ewv" 'enlarge-window)
(evil-ex-define-cmd "swh" 'shrink-window-horizontally)
(evil-ex-define-cmd "swv" 'shrink-window)
(evil-ex-define-cmd "kbw" 'kill-buffer-and-window)
(evil-ex-define-cmd "seth" 'evil-window-set-height)
(evil-ex-define-cmd "setv" 'evil-window-set-width)

(define-abbrev global-abbrev-table "drop" "/home/florian/Dropbox/")

(provide 'cmd_abr)
