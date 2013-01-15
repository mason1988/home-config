(setq org-capture-templates
 '(("t" "Todo" entry (file+headline "~/Zettelkasten/todo.org" "Todo-Eingang")
        "** TODO %?")
   ("j" "Journal" entry (file+datetree "~/org/journal.org")
        "* %?\nEntered on %U\n  %i\n  %a")
   ("w" "link template" entry
    (file+headline "~/Zettelkasten/notes.org" "Links")
     "* [[%:link][%:description]]"
     :empty-lines 1 :immediate-finish :unnarrowed :kill-buffer)))
(provide 'capture-templates)
