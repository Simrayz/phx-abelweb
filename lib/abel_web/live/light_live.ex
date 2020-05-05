defmodule AbelWeb.LightLive do
  use AbelWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :brightness, 10)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <h1>Front Porch Light</h1>
      <div id="light">
        <div class="flex h-12 overflow-hidden text-base bg-gray-400 rounded-lg mb-8 items-center">
          <span style="width: <%= @brightness %>%" class="h-full flex flex-col justify-center text-gray-900 text-center whitespace-no-wrap bg-yellow-400 font-bold">
            <%= @brightness %>%
          </span>
        </div>
        <button class="border rounded px-3 py-1 bg-blue-600 text-white" phx-click="off">
          Off
        </button>
        <button class="border rounded px-3 py-1 bg-blue-600 text-white" phx-click="down">
          v
        </button>
        <button class="border rounded px-3 py-1 bg-blue-600 text-white" phx-click="up">
          ^
        </button>
        <button class="border rounded px-3 py-1 bg-blue-600 text-white" phx-click="on">
          On
        </button>
        <button class="border rounded px-3 py-1 bg-blue-600 text-white" phx-click="rando">
          Random
        </button>
      </div>
    """
  end

  def handle_event("on", _, socket) do
    socket = assign(socket, :brightness, 100)
    {:noreply, socket}
  end

  def handle_event("up", _, socket) do
    socket = update(socket, :brightness, &min(&1 + 10, 100))
    {:noreply, socket}
  end

  def handle_event("down", _, socket) do
    socket = update(socket, :brightness, &max(&1 - 10, 0))
    {:noreply, socket}
  end

  def handle_event("off", _, socket) do
    {:noreply, assign(socket, :brightness, 0)}
  end

  def handle_event("rando", _, socket) do
    socket = assign(socket, :brightness, Enum.random(0..100))
    {:noreply, socket}
  end
end
