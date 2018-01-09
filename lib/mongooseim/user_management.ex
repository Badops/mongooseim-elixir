defmodule Mongooseim.Users do

    @moduledoc """

        This module contains the public API functions for interfacing with Mongooseim endpoint.
    """

	## XMPPhost_id: string
	## username: string
    ## body_params: a map with string keys
    

    @endpoint "users/"

    #The body_params contains the username and password
    def post_users(XMPPhost_id, body_params \\ "") do
        Mongooseim.request(:post,full_endpoint(XMPPhost_id), body_params)
    end

    def get_users(XMPPhost_id) do
        Mongooseim.request(:get, full_endpoint(XMPPhost_id))
    end

    def delete_users(XMPPhost_id, username \\ "") do
        Mongooseim.request(:delete, full_endpoint(XMPPhost_id) <> username)
    end

    #the body_params contains the new password for the user
    def change_users_password(XMPPhost_id, username \\ "", body_params \\ "") do
        Mongooseim.request(:put, full_endpoint(XMPPhost_id) <> username, body_params)
    end

    def full_endpoint(id \\ "") do
        @endpoint <> id
    end

end