defmodule Phoenix.LiveView.LiveRedirectTest do
  use ExUnit.Case

  import Phoenix.ConnTest
  import Phoenix.LiveViewTest

  alias Phoenix.LiveView
  alias Phoenix.LiveViewTest.{Endpoint, DOM}

  @endpoint Endpoint

  defp dead_render(conn) do
    html = html_response(conn, 200)
    [{_id, session_token, static_token} | _] = html |> DOM.parse() |> DOM.find_live_views()
    {conn, session_token, static_token}
  end


  # setup_all do
  #   ExUnit.CaptureLog.capture_log(fn -> Endpoint.start_link() end)
  #   :ok
  # end

  setup do
    {:ok, conn: Plug.Test.init_test_session(build_conn(), %{})}
  end

  test "live_redirect within same live session", %{conn: conn} do
    # {conn, session_token, static_token} = dead_render(get(conn, "/thermo-live-session"))
    # # {:ok, view, _html} = live(conn, "/events")
    # assert {:ok, thermo_live, _} = live(conn)
    # assert {:ok, clock_live, _} = live_redirect(thermo_live, to: "/clock-live-session")

  end

  test "live_redirect refused with mismatched live session", %{conn: conn} do
  end

  test "live_redirect refused with no live session", %{conn: conn} do
  end
end
