# Agento

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

  * Start postgrel service with `sudo service postgresql start`
  * Start Phoenix endpoint with `iex -S mix phx.server`
  

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Install Tailwind

https://dev.to/oliverandrich/learn-elixir-and-phoenix-add-tailwind-css-to-the-project-4fkf

```
cd assets/
npm uninstall sass-loader node-sass
npm install -D tailwindcss postcss-loader
npm install alpinejs
```

https://tailwindui.com/components

For AlpineJS support, added the follwing code to the `assets/js/app.js`:

```
import "alpinejs"
```

https://www.iso.org/obp/ui/#search/code/
http://www.unece.org/fileadmin/DAM/cefact/locode/Subdivision/agSub.htm
https://github.com/ip2location/ip2location-iata-icao
https://www.ip2location.com/free/country-information
https://github.com/ipregistry/iso3166
https://github.com/timshadel/subdivision-list

http://kejser.org/resources/free-data/free-data-iso-languages-csv-excel/
https://github.com/stefangabos/world_countries
