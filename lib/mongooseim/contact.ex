defmodule Mongooseim.Contact do
    @moduledoc """
        This module contains the public API functions for interfacing with Mongooseim endpoint.
    """

	## user: string(the JID of the user)
	## contact_id: string
    ## action_body_params: a map with string keys

    @endpoint "contacts/"

    def get_contact(user, opts \\ []) do
        Mongooseim.request(:get, full_endpoint(user), "", opts)
    end

    #contact in this function is a map with a string key, e.g { "jid": "alice@wonderland.lit"}
    def post_contact(user, contact, opts \\ []) do
        Mongooseim.request(:post, full_endpoint(user), contact, opts)
    end

    def delete_contact(user, contact, opts \\ []) do
        conc_path_params = user <> "/" <> contact
        Mongooseim.request(:delete, full_endpoint(conc_path_params), "", opts)
    end

    # action_body _params is a body parameter that can either be "subscribe" or "subscribed"
    def manage_subscription(user, contact,  action_body_params, opts \\ []) do
        conc_path_params = user <> "/" <> contact
        Mongooseim.request(:put, full_endpoint(conc_path_params), action_body_params, opts)
    end

    # action_body _params is a body parameter that can either be "connect" or "disconnect"
    def manage_contact(user, contact,  action_body_params, opts \\ []) do
        conc_path_params = user <> "/" <> contact <> "/manage"
        IO.inspect conc_path_params
        Mongooseim.request(:put, full_endpoint(conc_path_params), action_body_params, opts)
    end

    defp full_endpoint(param \\ "") do
        @endpoint <> param
    end
end


