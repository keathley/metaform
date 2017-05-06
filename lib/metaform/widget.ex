defmodule Metaform.Widget do
  use Ecto.Schema

  import Ecto.Changeset

  alias Metaform.Widget.Metadata

  schema "widgets" do
    embeds_one :metadata, Metaform.Widget.Metadata

    timestamps()
  end

  def changeset(widget, params \\ %{}) do
    widget
    |> cast(params, [])
    |> cast_embed(:metadata, with: &Metadata.changeset/2, required: true)
  end
end
