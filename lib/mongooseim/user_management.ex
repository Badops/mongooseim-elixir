defmodule Mongooseim.User do

    @moduledoc """
        This module contains the public API functions for interfacing with Mongooseim endpoint.
    """

	## xmpp_host: string
	## username: string
    ## body_params: a map with string keys

    ## when you attempt to create a user that has already been created, the server
    ## responses with a status code of 500

    ## When you attempt to delete a user that has already been deleted, or that does 
    ## not exists, you'll still get the usual response as if the user was really existed
    ## with the status code of 204
    
    @xmpp_host Application.get_env(:mongooseim, :xmpp_host)
    @endpoint "users/#{@xmpp_host}/"

    # The body_params contains the username and password fields
    def create_user(body_params, opts \\ []) do
        Mongooseim.request(:post, full_endpoint(), body_params, opts)
    end

    def get_users(opts \\ []) do
        Mongooseim.request(:get, full_endpoint(), "", opts)
    end

    def delete_user(username, opts \\ []) do
        Mongooseim.request(:delete, full_endpoint(username), "", opts)
    end

    # The body_params contains the new password for the user and contains only the newpass field 
    def change_user_password(username, body_params, opts \\ []) do
        Mongooseim.request(:put, full_endpoint(username), body_params, opts)
    end

    defp full_endpoint(param \\ "") do
        @endpoint <> param
    end
end