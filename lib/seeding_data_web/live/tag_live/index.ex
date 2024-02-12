defmodule SeedingDataWeb.TagLive.Index do
  use SeedingDataWeb, :live_view

  alias SeedingData.Contents
  alias SeedingData.Contents.Tag

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :tags, Contents.list_tags())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Tag")
    |> assign(:tag, Contents.get_tag!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Tag")
    |> assign(:tag, %Tag{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Tags")
    |> assign(:tag, nil)
  end

  @impl true
  def handle_info({SeedingDataWeb.TagLive.FormComponent, {:saved, tag}}, socket) do
    {:noreply, stream_insert(socket, :tags, tag)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    tag = Contents.get_tag!(id)
    {:ok, _} = Contents.delete_tag(tag)

    {:noreply, stream_delete(socket, :tags, tag)}
  end
end
