defmodule Mongooseim.Muc_light do
    @moduledoc """
        This module contains the public API functions for interfacing with Mongooseim endpoint.
    """

	## room_name: string
    ## body_params: a map with string keys
    ## user: string
    @xmpp_host Application.get_env(:mongooseim, :xmpp_host)
    @endpoint "muc-lights/#{@xmpp_host}/"

    # the body_params will contain the room details
    # the muc_lightroom is created under the specified xmpp host
    # body_params is the room details
    def create_muc_lightroom(body_params, opts \\ []) do
        Mongooseim.request(:post, full_endpoint(), body_params, opts)
    end

    # the body_params will contain the room details including the id
    def create_muc_lightroom_with_id(body_params, opts \\ []) do
        Mongooseim.request(:put, full_endpoint(), body_params, opts)
    end

    # the body_params will contain the invite itself
    def invite_user(room_name, body_params, opts \\ []) do
        conc_path_params = room_name <> "/participants"
        Mongooseim.request(:post, full_endpoint(conc_path_params), body_params, opts)
    end

    # the body_params will contain the message details
    def send_message_muc_lightroom(room_name, body_params, opts \\ []) do
        conc_path_params = room_name <> "/messages"
        Mongooseim.request(:post, full_endpoint(conc_path_params), body_params, opts)
    end

    def delete_muc_lightroom(room_name, user, opts \\ []) do
        conc_path_params = room_name <> "/" <> user <> "/management"
        Mongooseim.request(:delete, full_endpoint(conc_path_params), "", opts)
    end

    defp full_endpoint(param \\ "") do
        @endpoint <> param
    end

end