defmodule Metaform.SchemaBuilder do
  defmacro __before_compile__(_env) do
    quote do
      @primary_key {:id, :binary_id, autogenerate: true}
      schema "" do
          field :title, :string
      end

      def changeset(metadata, params) do
        metadata
        |> cast(params, [:title])
        |> validate_required([:title])
      end
    end
  end
end
