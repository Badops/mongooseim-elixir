defmodule Mongooseim.Messages do

    @moduledoc """

        This module contains the public API functions for interfacing with Mongooseim endpoint.
    """

	## owner_id: string
	## other_id: string
    ## body_params: a map with string keys
    ## opts: keyword list of options

    @endpoint "messages/"

    def post_message(body_params \\ "") do
        Mongooseim.request(:post, full_endpoint(), body_params)
    end

    def get_message(owner_id \\ "", opts \\ []) do 
        Mongooseim.request(:get, full_endpoint(owner_id), opts)
    end

    def get_message_with(owner_id \\ "", other_id \\ "", opts \\ []) do
        Mongooseim.request(:get, full_endpoint(owner_id) <> other_id, opts)
    end

    def full_endpoint(id \\ "") do
        @endpoint <> id
    end
end