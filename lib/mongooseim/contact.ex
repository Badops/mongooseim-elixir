defmodule Mongooseim.Contact do

    @moduledoc """

        This module contains the public API functions for interfacing with Mongooseim endpoint.
    """

	## user_id: string
	## contact_id: string
    ## action_body_params: a map with string keys

@endpoint "contacts/"

    def get_contact(user_id) do
        Mongooseim.request(:get, full_endpoint(user_id))
    end

    #contact_id in this function is a map with a string key, e.g { "jid": "alice@wonderland.lit"}
    def post_contact(contact_id \\ "") do
        Mongooseim.request(:post, full_endpoint(user_id), contact_id)
    end

    def delete_contact(user_id, contact_id) do
        Mongooseim.request(:delete, full_endpoint(user_id) <> contact_id)
    end

    #Action_body _params is a body parameter that can either be "subscribe" or "subscribed"
    def manage_subscription(user_id, contact_id,  action_body_params \\ "") do
        Mongooseim.request(:put, full_endpoint(user_id) <> contact_id, action_body_params)
    end

    #Action_body _params is a body parameter that can either be "connect" or "disconnect"
    def manage_contact(user_id, contact_id \\ "",  action_body_params \\ "") do
        Mongooseim.request(:put, full_endpoint(user_id) <> contact_id <> "/manage", action_body_params)
    end

    defp full_endpoint(id \\ "") do
        @endpoint <> id
    end
end


