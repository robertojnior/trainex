defmodule TrainexWeb.Schema do
  use Absinthe.Schema

  import_types TrainexWeb.Schema.Types.Root

  query do
    import_fields :queries
  end

  mutation do
    import_fields :mutations
  end
end
