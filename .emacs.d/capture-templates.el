(setq org-capture-templates
 '(("t" "Todo" entry (file+headline "~/Zettelkasten/refile.org" "todo")
        "** TODO %?\n %a\n Entered on %U")
   ("i" "Idea" entry (file+headline "~/Zettelkasten/refile.org" "idea")
        "** TODO %?\n %a\n Entered on %U")
   ("p" "Problem" entry (file+headline "~/Zettelkasten/refile.org" "problem")
        "** TODO \n %a\n Entered on %U")
   ("j" "Journal" entry (file+datetree "~/org/journal.org")
        "* %?\nEntered on %U\n  %i\n  %a")
   ("z" "Studium - Todo" entry (file+headline "~/Zettelkasten/todo.org" "Todo-Eingang-Studium")
        "** TODO %?\n %a\n Entered on %U")
   ("w" "link template" entry
    (file+headline "~/Zettelkasten/notes.org" "Links")
     "* [[%:link][%:description]]"
     :empty-lines 1 :immediate-finish :unnarrowed :kill-buffer)))
(provide 'capture-templates)
