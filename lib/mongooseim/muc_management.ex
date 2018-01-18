defmodule Mongooseim.Muc do
    @moduledoc """
        This module contains the public API functions for interfacing with Mongooseim endpoint.
    """

	## room_name: string
    ## body_params: a map with string keys
    ## user_nickname: string

    @xmpp_host Application.get_env(:mongooseim, :xmpp_host)
    @endpoint "mucs/#{@xmpp_host}/"

    # the body_params will contain the room details
    def create_muc_room(body_params, opts \\ []) do
        Mongooseim.request(:post, full_endpoint(), body_params, opts)
    end

    # the body_params will contain the invite itself
    def invite_user(room_name, body_params, opts \\ []) do
        conc_path_params = room_name <> "/participants"
        Mongooseim.request(:post,full_endpoint(conc_path_params), body_params, opts)
    end

    # the body_params will contain the message details
    def send_message_muc_lightroom(room_name, body_params, opts \\ []) do
        conc_path_params = room_name <> "/messages"
        Mongooseim.request(:post,full_endpoint(conc_path_params), body_params, opts)
    end

    def delete_muc_lightroom(room_name, user_nickname, opts \\ [] ) do
        conc_path_params = room_name <> "/" <> user_nickname
        Mongooseim.request(:delete,full_endpoint(conc_path_params), "", opts)
    end

    defp full_endpoint(param \\ "") do
        @endpoint <> param
    end

end