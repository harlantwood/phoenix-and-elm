defmodule PhoenixAndElm.Router do
  use PhoenixAndElm.Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  scope "/", PhoenixAndElm do
    # Use the default browser stack
    pipe_through(:browser)

    get("/*path", PageController, :index)
  end
end
