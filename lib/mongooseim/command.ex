defmodule Mongooseim.Command do
  @moduledoc """
  	This module contains the public API functions for interfacing with Mongooseim endpoint.
  """
	
	## opts: Keyword list
  @endpoint "commands/"

  def get_commands(opts \\ []) do
  	Mongooseim.request(:get, @endpoint, "", opts)
  end
end