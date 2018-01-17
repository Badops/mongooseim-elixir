defmodule Mongooseim.User do

    @moduledoc """
        This module contains the public API functions for interfacing with Mongooseim endpoint.
    """

	## xmpp_host: string
	## username: string
    ## body_params: a map with string keys
    ## xmpp_host: string

    ## when you attempt to create a user that has already been created, the server
    ## responses with a status code of 500

    ## When you attempt to delete a user that has already been deleted, or that does 
    ## not exists, you'll still get the usual response as if the user was really deleted
    ## with the status code of 204
    
  
    @endpoint "users/"

    #The body_params contains the username and password
    def create_user(xmpp_host, body_params, opts \\ []) do
        Mongooseim.request(:post, full_endpoint(xmpp_host), body_params, opts)
    end

    def get_users(xmpp_host, opts \\ []) do
        Mongooseim.request(:get, full_endpoint(xmpp_host), "", opts)
    end

    def delete_user(xmpp_host, username, opts \\ []) do
        Mongooseim.request(:delete, full_endpoint(xmpp_host <> "/" <> username), "", opts)
    end

    #the body_params contains the new password for the user
    def change_user_password(xmpp_host, username, body_params, opts \\ []) do
        Mongooseim.request(:put, full_endpoint(xmpp_host <> "/" <> username), body_params, opts)
    end

    defp full_endpoint(param \\ "") do
        @endpoint <> param
    end
end