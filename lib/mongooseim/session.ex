defmodule Mongooseim.Sessions do

    @moduledoc """

        This module contains the public API functions for interfacing with Mongooseim endpoint.
    """

	## XMPPhost_id: string
	## username: string
    ## resource_name: string 
    

    @endpoint "sessions/"

    def get_sessions(xmpp_host) do
        Mongooseim.request(:get, full_endpoint(xmpp_host))
    end

    def delete_sessions(xmpp_host, username \\ "", resource_name \\ "") do
        Mongooseim.request(:delete, full_endpoint(xmpp_host) <> username <> resource_name)
    end

    def full_endpoint(param \\ "") do
        @endpoint <> param
    end
end