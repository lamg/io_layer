open! Core

type context =
  { now_str : unit -> string
  ; now_unix : unit -> int64
  ; now : unit -> Time.t
  }

let now_str () =
  let now = Time.now () in
  Time.to_string_iso8601_basic ~zone:Core_private.Time_zone.utc now
;;

let now_unix () = Time_now.nanoseconds_since_unix_epoch () |> Int63.to_int64
let main_ctx = { now = Time.now; now_str; now_unix }
