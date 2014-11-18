module type Uuid_generator = sig
  val generate : unit -> Sociaml_maildir.Uuid.t
end


module Make 
    (Email : Sociaml_maildir.Email)
    (Store : Irmin.S)
    (ID_generator : Uuid_generator)
    = struct
  
  module Email = Email
    
  type t = string
    
  let init path = path 
    
  let add path email =
    let (>>=) = Lwt.(>>=) in
    let module Uuid = Sociaml_maildir.Uuid in
    let uuid = ID_generator.generate () in
    let path_list = [ path; "new"; (Uuid.to_string uuid) ] in
    Store.create () >>= fun t ->
    Store.update t path_list (email |> Email.to_string |> Store.Value.of_string) >>= fun _ ->
    Lwt.return uuid
    
end