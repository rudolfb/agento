# https://hexdocs.pm/saxy/Saxy.html#parse_stream/4

# import SaxEventHandler
# stream = File.stream!("1LAPKZR06.xml")
# Saxy.parse_stream(stream, SaxEventHandler, [])

import Meeseeks
import Meeseeks.XPath

file = File.read!("assets/private/HTL_AGA_06.xml")

document = Meeseeks.parse(file, :xml)

results =
  Meeseeks.all(document, xpath("/Hotels/Hotel/Rooms/Room/Prices/PerDayPrices/PerDayPrice"))

for result <- results do
  Meeseeks.tree(result)
end

result = Meeseeks.one(document, xpath("/Hotels/Hotel/Rooms/Room/Prices/PerDayPrices/PerDayPrice"))
tree = Meeseeks.tree(result)
{"PerDayPrice", attrlist, valuelist} = tree

defmodule PerDayPrice do
  defstruct BuyNet: "",
            BuyAcct: "",
            Acct: "",
            BuyCurr: "",
            BuyAmtBaseCurr: "",
            BuyExchgRate: "",
            Day: "",
            P1: "",
            Type: "",
            DescId: ""
end

[head | tail] = attrlist
head
theatom = String.to_atom(elem(head, 0))
thevalue = elem(head, 1)

Map.put(%PerDayPrice{}, String.to_atom(elem(head, 0)), elem(head, 1))
