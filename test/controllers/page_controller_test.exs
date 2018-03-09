defmodule PhoenixAndElm.PageControllerTest do
  use PhoenixAndElm.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Crafted with ♥"
  end
end
