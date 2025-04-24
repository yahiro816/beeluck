[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared uta = let
  ソース = CosmosDB.Contents("https://uta.documents.azure.com:443/", [NUMBER_OF_RETRIES = null, ENABLE_AVERAGE_FUNCTION_PASSDOWN = null, ENABLE_SORT_PASSDOWN_FOR_MULTIPLE_COLUMNS = null]),
  #"ナビゲーション 1" = ソース{[Name = "uta", Kind = "Database"]}[Data],
  #"ナビゲーション 2" = #"ナビゲーション 1"{[Name = "uta", Kind = "Schema"]}[Data],
  #"ナビゲーション 3" = #"ナビゲーション 2"{[Name = "uta", Kind = "Table"]}[Data],
  #"Filtered rows" = Table.SelectRows(#"ナビゲーション 3", each ([Properlyregistered_favorite_color] = "red"))
in
  #"Filtered rows";
