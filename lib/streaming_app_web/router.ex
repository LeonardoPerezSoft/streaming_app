defmodule StreamingAppWeb.Router do

  alias StreamingAppWeb.Movie_ActorController
  alias StreamingAppWeb.ActorController
  alias StreamingAppWeb.MovieController
  alias StreamingAppWeb.StreamerController
  use StreamingAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    resources "/streamers", StreamerController, except: [:edit, :new, :update]
    put "/streamers/:id", StreamerController, :update

    resources "/movies",MovieController, except: [:edit, :new, :update]
    put "/movies/:id", MovieController, :update

    resources "/actors", ActorController, except: [:edit, :new, :update]
    put "/actors/:id", ActorController, :update

    resources "/movies_actors", Movie_ActorController,  except: [:edit, :new, :update]
    put "/movies_actors", Movie_ActorController, :update





  end
end
