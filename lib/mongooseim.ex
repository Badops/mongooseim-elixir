defmodule Mongooseim do
  @moduledoc """
  Documentation for Mongooseim.
  """

  
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
    {:ok, process_response_body(body)}
  end

  defp handle_response({:ok, %HTTPoison.Response{body: body, status_code: 201}}) do
    {:ok, process_response_body(body)}
  end

  defp handle_response({:ok, %HTTPoison.Response{body: body, status_code: code}}) do
    message_error = process_response_body(body) 

    error_tuple = 
    case code do
      _ -> {:error, %StatusCodeError{status_code: code, message: message_error}}
    end

    error_tuple
  end

  defp handle_response({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, %ConnectionError{message: reason}}
  end

  defp process_response_body(body) do
    Poison.decode!(body)
  end

  def encode_body(body) do
    Poison.encode!(body)
  end
end
