defmodule Metaform.Web.Router do
  use Metaform.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Metaform.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/widgets", WidgetController, only: [:index, :new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Metaform.Web do
  #   pipe_through :api
  # end
end
