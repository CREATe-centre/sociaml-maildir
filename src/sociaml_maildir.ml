module type Stringable = sig
	type t
	val to_string : t -> string
	val of_string : string -> t
end


module type Email = sig
	include Stringable
end


module Uuid : Stringable = struct
	type t = string
	let to_string t = t
	let of_string t = t
end


module type Backend = sig
	module Email : Email
	type t
	val add : t -> Email.t -> Uuid.t Lwt.t 
end


module type S = sig
	include Backend
end


module Make (Backend : Backend) : S = struct
	module Email = Backend.Email
	type t = Backend.t
	let add = Backend.add
end
