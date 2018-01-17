defmodule Response do
  defstruct body: nil, status_code: nil
end

defmodule Mongooseim do
  @moduledoc """
  Documentation for Mongooseim.
  """
  alias Mongooseim.Error.ConnectionError
  alias Mongooseim.Error.StatusCodeError

  
  @api_url "http://localhost:8088/api/"
  @header [{"Content-Type", "application/json"}, {"Accept", "application/json"}]
  
  def request(action, endpoint, body \\ "", opts \\ []) do
    HTTPoison.request(action, full_url(endpoint), encode_body(body), @header, opts)
    |> handle_response
  end

  def full_url(endpoint) do
    @api_url <> endpoint
  end

  defp handle_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    {:ok, process_response(decode_body(body), 200)}
  end

  defp handle_response({:ok, %HTTPoison.Response{body: body, status_code: 201}}) do
    {:ok, process_response(body, 201)}
  end

  defp handle_response({:ok, %HTTPoison.Response{body: body, status_code: 204}}) do
    {:ok, process_response(body, 204)}
  end
 
  defp handle_response({:ok, %HTTPoison.Response{body: body, status_code: code}}) do
    message_error = process_response(body, code) 

    error_tuple = 
    case code do
      _ -> {:unsuccessful, %StatusCodeError{status_code: code, message: message_error.body}}
      # message key has the value of body in HTTPoison.Response 
    end

    error_tuple
  end

  defp handle_response({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, %ConnectionError{message: reason}}
  end

  defp process_response(body, status_code) do
    %Response{body: body, status_code: status_code}
  end

  defp decode_body(body) do
    Poison.decode(body)
    |> elem(1)
  end

  defp encode_body(body) do
    Poison.encode!(body)
  
  end
end
