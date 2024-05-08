defmodule GistWeb.Layouts.SwiftUI do
  use GistNative, [:layout, format: :swiftui]

  embed_templates "layouts_swiftui/*"
end
