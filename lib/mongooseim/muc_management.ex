defmodule Mongooseim.Muc do

    @moduledoc """

        This module contains the public API functions for interfacing with Mongooseim endpoint.
    """

	## XMPPhost_id: string
	## room_name: string
    ## body_params: a map with string keys
    ## user_nickname: string


    @endpoint "mucs/"

    #The body_params will contain the room details
    def create_muc_room(XMPPhost_id, body_params \\ "") do
        Mongooseim.request(:post,full_endpoint(XMPPhost_id), body_params)
    end

    #The body_params will contain the invite itself
    def invite_user(XMPPhost_id, room_name, body_params \\ "") do
        Mongooseim.request(:post,full_endpoint(XMPPhost_id)  <> room_name <> "/paricipants", body_params)
    end

    #The body_params will contain the message details
    def send_message_muc_lightroom(XMPPhost_id, room_name, body_params \\ "") do
        Mongooseim.request(:post,full_endpoint(XMPPhost_id)  <> room_name <> "/messages", body_params)
    end

    def delete_muc_lightroom(XMPPhost_id, room_name, user_nickname ) do
        Mongooseim.request(:delete,full_endpoint(XMPPhost_id)  <> room_name <> user_nickname)
    end

    defp full_endpoint(id \\ "") do
        @endpoint <> id
    end

end