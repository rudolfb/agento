# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Agento.Repo.insert!(%Agento.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Agento.Repo
alias Agento.{Language}

Repo.insert!(%Language{language: "en", default: true})
Repo.insert!(%Language{language: "de", default: false})
Repo.insert!(%Language{language: "fr", default: false})
Repo.insert!(%Language{language: "it", default: false})
