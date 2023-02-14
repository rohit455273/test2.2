testServer(expr = {
  # Set the `size` slider and check the output
  #app$snapshot()
  
  
  
  # Input 'l_groups' was set, but doesn't have an input binding.
  session$setInputs(o = "Ficus microcarpa nitida 'Green Gem' :: Indian Laurel Fig Tree 'Green Gem'")
  #app$snapshot()
  # Input 'l_marker_mouseover' was set, but doesn't have an input binding.
  # Input 'l_marker_mouseout' was set, but doesn't have an input binding.
  # Input 'l_marker_mouseover' was set, but doesn't have an input binding.
  # Input 'l_marker_click' was set, but doesn't have an input binding.
  # Input 'l_marker_mouseout' was set, but doesn't have an input binding.
  #app$snapshot()
  
  expect_equal(input$o,"Ficus microcarpa nitida 'Green Gem' :: Indian Laurel Fig Tree 'Green Gem'")
  session$setInputs(o = "Myoporum laetum :: Myoporum")
  
  
})
