(setq gnus-select-method '(nnml ""))

(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

(setq user-mail-address "floppycode@yahoo.de")
(setq user-full-name "Florian Lerch")
(setq mail-sources '((pop :server "pop.mail.yahoo.com"
                          :user "floppycode@yahoo.de"
                          :password "nggyu1")
		     (pop :server "pop.mail.yahoo.com"
			  :user "lerch.floriar@yahoo.de"
			  :password "homie1")))
(setq send-mail-function 'smtpmail-send-it)
(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-default-smtp-server "smtp.mail.yahoo.com")

  (setq smtpmail-auth-credentials '(("smtp.mail.yahoo.com" "465" "floppycode@yahoo.de" "nggyu1")))
  (setq smtpmail-starttls-credentials '(("smtp.mail.yahoo.com" "465" nil nil)))
