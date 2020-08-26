# ---
# Excerpted from "Programming Ecto",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/wmecto for more book information.
# ---
##############################################
## Ecto Playground
#
# This script sets up a sandbox for experimenting with Ecto. To
# use it, just add the code you want to try into the Playground.play/0
# function below, then execute the script via mix:
#
#   mix run priv/repo/playground.exs
#
# The return value of the play/0 function will be written to the console
#
# To get the test data back to its original state, just run:
#
#   mix ecto.reset
#
alias Agento.Repo
# alias Agento.{Artist, Album, Track, Genre, Log, AlbumWithEmbeds, ArtistEmbed, TrackEmbed}
alias Agento.{Country}
alias Ecto.Multi

import Ecto.Query
import Ecto.Changeset

defmodule Playground do
  # this is just to hide the "unused import" warnings while we play
  def this_hides_warnings do
    [Artist, Album, Track, Genre, Repo, Multi, Log, AlbumWithEmbeds, ArtistEmbed, TrackEmbed]
    from(a in "artists")
    from(a in "artists", where: a.id == 1)
    cast({%{}, %{}}, %{}, [])
  end

  def play do
    ###############################################
    #
    # PUT YOUR TEST CODE HERE
    #
    ##############################################

    File.stream!("priv/repo/ISO3166-1_CountryCodes.csv", [:trim_bom])
    |> CSV.decode(separator: ?;, headers: true)
    |> Enum.take(3)
    |> Enum.map(fn {:ok, x} -> x end)
    |> Enum.map(fn x -> Map.put(x, "nr", pad_leading_zero(x["nr"])) end)
  end

  def pad_leading_zero(string) do
    String.pad_leading(string, 3, "0")
  end
end

# add your test code to Playground.play above - this will execute it
# and write the result to the console
IO.inspect(Playground.play())
