defmodule Mongooseim.Session do
    @moduledoc """
        This module contains the public API functions for interfacing with Mongooseim endpoint.
    """

	## XMPPhost_id: string
	## username: string
    ## resource_name: string 
    ## xmpp_host: string
    
    @xmpp_host Application.get_env(:mongooseim, :xmpp_host)
    @endpoint "sessions/#{@xmpp_host}/"

    def get_sessions(opts \\ []) do
        Mongooseim.request(:get, full_endpoint(), "", opts)
    end

    def delete_session(username, resource_name, opts \\ []) do
        conc_path_params = username <> resource_name
        Mongooseim.request(:delete, full_endpoint(conc_path_params), "", opts)
    end

    def full_endpoint(param \\ "") do
        @endpoint <> param
    end
end