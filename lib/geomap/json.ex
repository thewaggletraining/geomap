defmodule Geomap.Json do
  def get( domain, path, header \\ [] ) do
		domain <> path
		|> HTTPoison.get!( header )
		|> parse
	end

	def post( domain, path, body, header \\ [] ) do
		domain <> path
		|> HTTPoison.post!( body, header )
		|> parse
	end

	def put( domain, path, body, header \\ [] ) do
		domain <> path
		|> HTTPoison.put!( body, header )
		|> parse
	end


	def patch( domain, path, body, header \\ [] ) do
		domain <> path
		|> HTTPoison.patch!( body, header )
		|> parse
	end

	def delete( domain, path, header \\ [] ) do
		domain <> path
		|> HTTPoison.delete!( header )
		|> get_body
	end

	def head( domain, path, header \\ [] ) do
		domain <> path
		|> HTTPoison.head!( header )
		|> get_body
	end

	defp parse( response ) do
		response
		|> get_body
		|> Poison.decode!
	end
	defp get_body( %{ status_code: 200, body: body } ), do: body
	defp get_body( %{ status_code: 201, body: body } ), do: body
	defp get_body( %{ status_code: 204, body: body } ), do: body
end
