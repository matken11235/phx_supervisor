defmodule SupervisorPhoenixWeb.Router do
  use SupervisorPhoenixWeb, :router

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

  scope "/", SupervisorPhoenixWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/kill", PageController, :kill
    get "/json", JsonController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", SupervisorPhoenixWeb do
  #   pipe_through :api
  # end
end
