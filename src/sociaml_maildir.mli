module type Stringable = sig
	type t
	val to_string : t -> string
	val of_string : string -> t
end


module type Email = Stringable


module Uuid : Stringable


module type Backend = sig
	module Email : Email
	type t
	val add : t -> Email.t -> Uuid.t Lwt.t
end


module type S = sig
	include Backend
end


module Make (Backend : Backend) : S
