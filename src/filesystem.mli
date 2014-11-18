module Make 
    (Email :Sociaml_maildir.Email) 
    : sig
	include Sociaml_maildir.S
	val init : string -> t
end