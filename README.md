# Solextria

> Solectria DataLogger data fetcher and parser

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `solextria` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:solextria, "~> 0.1.2"}]
    end
    ```

  2. Ensure `solextria` is started before your application:

    ```elixir
    def application do
      [applications: [:solextria]]
    end
    ```

## Examples

    Solextria.get(148)
    {:ok,
     [{"t", "2016-08-09T06:56:50Z"},
      {"plant",
       [{"id", "6dca1415-e54e-425e-b88e-dfabf2d91980"}, {"v", "1"},
        {"locale", "en-US"}],
       [{"name", [], ["SolrenView test Site's"]},
        {"activationdate", [], ["2010-11-02"]},
        {"location", [],
         [{"latitude", [], ["42.4191"]}, {"longitude", [], ["-71.0086"]},
          {"line1", [], ["360 Merrimack Street1"]}, {"city", [], ["Lawrence"]},
          {"state", [], ["MA"]}, {"postal", [], []},
          {"timezone", [], ["-4:00"]}]}]},
      {"sunspecdata",
       [{"v", "1"}, {"periodstart", "2016-08-09T06:55:00Z"},
        {"periodend", "2016-08-09T06:56:00Z"}],
       [{"d",
         [{"lid", "00:90:C2:ED:A8:E2"}, {"man", "solren"}, {"mod", "0_C20130730"},
          {"t", "2016-08-09T04:00:08Z"}],
         [{"m", [{"id", "202"}, {"sn", "EDA8E2"}],
           [{"p", [{"id", "WH"}], ["null"]},
            {"p", [{"id", "WHL"}], ["2948113000"]}]},
          {"m", [{"id", "103"}, {"sn", "110919-04"}],
           [{"p", [{"id", "WH"}], ["null"]}, {"p", [{"id", "WHL"}], ["2899972500"]},
            {"p", [{"id", "W"}], ["null"]}, {"p", [{"id", "PPVphAB"}], ["null"]},
            {"p", [{"id", "PPVphBC"}], ["null"]},
            {"p", [{"id", "PPVphCA"}], ["null"]}, {"p", [{"id", "DCV"}], ["null"]},
            {"p", [{"id", "A"}], ["null"]}, {"p", [{"id", "FAULT"}], ["null"]},
            {"p", [{"id", "FAULTC"}], ["null"]},
            {"p", [{"id", "FAULTI"}], ["null"]},
            {"p", [{"id", "FAULTST"}], ["null"]}]}]},
        {"d",
         [{"lid", "00:90:C2:ED:DD:59"}, {"man", "solren"}, {"mod", "0_C20130730"},
          {"t", "2016-08-09T06:55:51Z"}],
         [{"m", [{"id", "202"}, {"sn", "EDDD59"}],
           [{"p", [{"id", "WH"}], ["0"]}, {"p", [{"id", "WHL"}], ["3070176600"]}]},
          {"m", [{"id", "103"}, {"sn", "110311-09"}],
           [{"p", [{"id", "WH"}], ["null"]}, {"p", [{"id", "WHL"}], ["781370500"]},
            {"p", [{"id", "W"}], ["null"]}, {"p", [{"id", "PPVphAB"}], ["null"]},
            {"p", [{"id", "PPVphBC"}], ["null"]},
            {"p", [{"id", "PPVphCA"}], ["null"]}, {"p", [{"id", "DCV"}], ["null"]},
            {"p", [{"id", "A"}], ["null"]}, {"p", [{"id", "FAULT"}], ["null"]},
            {"p", [{"id", "FAULTC"}], ["null"]},
            {"p", [{"id", "FAULTI"}], ["null"]},
            {"p", [{"id", "FAULTST"}], ["null"]},
            {"p", [{"id", "DCA"}], ["2.2"]}]}]},
        {"d",
         [{"lid", "00:90:C2:EB:2A:EA"}, {"man", "solren"}, {"mod", "0_C20130730"},
          {"t", "2016-08-09T04:00:45Z"}],
         [{"m", [{"id", "202"}, {"sn", "EB2AEA"}],
           [{"p", [{"id", "WH"}], ["null"]},
            {"p", [{"id", "WHL"}], ["1225363400"]}]},
          {"m", [{"id", "103"}, {"sn", "110919-27"}],
           [{"p", [{"id", "WH"}], ["null"]}, {"p", [{"id", "WHL"}], ["1225054400"]},
            {"p", [{"id", "W"}], ["null"]}, {"p", [{"id", "PPVphAB"}], ["null"]},
            {"p", [{"id", "PPVphBC"}], ["null"]},
            {"p", [{"id", "PPVphCA"}], ["null"]}, {"p", [{"id", "DCV"}], ["null"]},
            {"p", [{"id", "A"}], ["null"]}, {"p", [{"id", "FAULT"}], ["null"]},
            {"p", [{"id", "FAULTC"}], ["null"]},
            {"p", [{"id", "FAULTI"}], ["null"]},
            {"p", [{"id", "FAULTST"}], ["null"]}, {"p", [{"id", "DCA"}], []}]}]},
        {"d",
         [{"lid", "00:90:C2:E5:7B:00"}, {"man", "solren"}, {"mod", "3_20130816"},
          {"t", "2016-08-09T06:55:46Z"}],
         [{"m", [{"id", "302"}, {"sn", "E57B00"}],
           [{"p", [{"id", "Irr"}], ["12.20"]}, {"p", [{"id", "TmpAmb"}], ["19.75"]},
            {"p", [{"id", "TmpBOM"}], ["16.85"]},
            {"p", [{"id", "WndSpd"}], ["1.12"]},
            {"p", [{"id", "WndDir"}], ["162.30"]}]}]}]}]}


You can pass the following arguments as second parameter:

- `username` - username if auth is enabled
- `password` - password if auth is enabled
- `base_url` - base url for fetching data. defaults to `http://solrenview.com`
- `start_ts` - beginning timestamp as unix timestamp
- `end_ts` - end timestamp as unix timestamp
- `uri` - URI path to append to base_url
- `realm` - Realm when authentication is enabled
