module type Uuid_generator = sig
  val generate : unit -> Sociaml_maildir.Uuid.t
end


module Make 
    (Email : Sociaml_maildir.Email)
    (Store : Irmin.S)
    (ID_generator : Uuid_generator)
    : sig
  include Sociaml_maildir.S
  val init : string -> t
end