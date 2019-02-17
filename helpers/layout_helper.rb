def layout_wrapper(view = :welcome, add_layout = true)
  erb view, layout: :layout if add_layout
end
