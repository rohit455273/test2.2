app <- AppDriver$new("../../")
app$snapshotInit("mytest")

# Input 'l_center' was set, but doesn't have an input binding.
# Input 'l_groups' was set, but doesn't have an input binding.
app$set_Inputs(ml = TRUE)
# Input 'l_groups' was set, but doesn't have an input binding.
# Input 'l_groups' was set, but doesn't have an input binding.
# Input 'l_bounds' was set, but doesn't have an input binding.
# Input 'l_center' was set, but doesn't have an input binding.
# Input 'l_zoom' was set, but doesn't have an input binding.
# Input 'l_marker_mouseover' was set, but doesn't have an input binding.
# Input 'l_marker_mouseout' was set, but doesn't have an input binding.
app$expect_snapshot()
app$expect_snapshot()
app$expect_snapshot()
app$expect_snapshot()

app$set_Inputs(o = "Ficus microcarpa nitida 'Green Gem' :: Indian Laurel Fig Tree 'Green Gem'")
app$expect_snapshot()
#app$snapshot()
