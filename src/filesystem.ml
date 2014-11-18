module Make 
    (Email : Sociaml_maildir.Email)
	  = struct
  
	module Email = Email
	
	type t = Maildir.t
	
	let init = Maildir.create ~init:true
	
	let generate_uuid () = ""
	
	let add t email =
    let open Sociaml_maildir in
    Email.to_string email |> Maildir.add t |> Uuid.of_string |> Lwt.return
	
end