defmodule Mongooseim.Sessions do

    @moduledoc """

        This module contains the public API functions for interfacing with Mongooseim endpoint.
    """

	## XMPPhost_id: string
	## username: string
    ## resource_name: string 
    

    @endpoint "sessions/"

    def get_sessions(XMPPhost_id) do
        Mongooseim.request(:get, full_endpoint(XMPPhost_id))
    end

    def delete_sessions(XMPPhost_id, username \\ "", resource_name \\ "") do
        Mongooseim.request(:delete, full_endpoint(XMPPhost_id) <> username <> resource_name)
    end

    def full_endpoint(id \\ "") do
        @endpoint <> id
    end
end