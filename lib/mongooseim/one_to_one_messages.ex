defmodule Mongooseim.Message do
    @moduledoc """
        This module contains the public API functions for interfacing with Mongooseim endpoint.
    """

	## owner_id: string
	## other_id: string
    ## body_params: a map with string keys
    ## opts: keyword list of options
    ## owner: user's JID (f.e. alice@wonderland.lit)
    ## other_user: the other party's JID
    ## before: Messages earlier then the given timestamp (defaults to now)
    ## limit: an upper bound on the number of messages to fetch from the archive (defaults to 100)

    @endpoint "messages/"

    def post_message(body_params, opts \\ []) do
        Mongooseim.request(:post, full_endpoint(), body_params, opts)
    end

    def get_messages(owner, before, limit, opts \\ []) do 
        query_str = "?before=#{before}&limit=#{limit}"
        conc_path_params = owner <> query_str
        Mongooseim.request(:get, full_endpoint(conc_path_params), "", opts)
    end

    def get_messages_with(owner, other_user, before, limit, opts \\ []) do
        query_str = "?before=#{before}&limit=#{limit}"
        conc_path_params = owner <> "/" <> other_user <> query_str
        Mongooseim.request(:get, full_endpoint(conc_path_params), "", opts)
    end

    def full_endpoint(param \\ "") do
        @endpoint <> param
    end
end