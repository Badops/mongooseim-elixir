defmodule Mongooseim.Command do

    @moduledoc """

        This module contains the public API functions for interfacing with Mongooseim endpoint.
    """
    
	## opts: Keyword list

    @endpoint "commands/"

    def get_commands(opts \\ []) do
        Mongooseim.request(:get, full_endpoint(), "", opts)
    end

    defp full_endpoint(param \\ "") do
        @endpoint <> param
    end
end