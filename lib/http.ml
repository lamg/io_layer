open Lwt
open Cohttp
open Cohttp_lwt_unix
open Core

let proc_resp (resp, body) =
  let code = resp |> Response.status |> Code.code_of_status in
  body |> Cohttp_lwt.Body.to_string >|= fun body -> code, body
;;

let build_uri (path : string) (qs : (string * string list) list) =
  List.fold qs ~init:(Uri.of_string path) ~f:Uri.add_query_param
;;

let get uri ((header, value) : string * string) =
  Client.get ~headers:(Header.of_list [ header, value ]) uri
  >>= proc_resp
  |> Lwt_main.run
;;

let post uri ((header, value) : string * string) =
  Client.post ~headers:(Header.of_list [ header, value ]) uri
  >>= proc_resp
  |> Lwt_main.run
;;

let get_with_auth uri token = get uri ("Authorization", "Bearer " ^ token)

type context = { get_with_auth : Uri.t -> string -> int * string }

let main_ctx = {
  get_with_auth
}
