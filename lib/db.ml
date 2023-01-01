let do_query db_uri query =
  Caqti_lwt.with_connection db_uri query
  |> Lwt_main.run
  |> function
  | Ok r -> r
  | Error e -> Caqti_error.Exn e |> raise
;;

type context =
  {
     db_uri : Uri.t
  }

let main_ctx db_uri = { db_uri }
