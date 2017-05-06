defmodule Metaform.Web.WidgetController do
  use Metaform.Web, :controller

  alias Metaform.Repo
  alias Metaform.Widget

  def index(conn, _) do
    widgets = Repo.all(Widget)
    render conn, "index.html", widgets: widgets
  end

  def new(conn, _params) do
    changeset = Widget.changeset(%Widget{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"widget" => params}) do
    %Widget{}
    |> Widget.changeset(params)
    |> Repo.insert()
    |> case do
         {:ok, _product} ->
           redirect(conn, to: widget_path(conn, :index))
         {:error, changeset} ->
           render(conn, "new.html", changeset: changeset)
       end
  end
end
