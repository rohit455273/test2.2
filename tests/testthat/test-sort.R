# Test the lexical_sort function from R/example.R
#test_that("Lexical sorting works", {
 # expect_equal(lexical_sort(c(1, 2, 3)), c(1, 2, 3))
  #expect_equal(lexical_sort(c(1, 2, 3, 13, 11, 21)), c(1, 11, 13, 2, 21, 3))
#})

#snapshot_review("")

sliderInput01<-function(id){
  
  
  shiny::selectInput("x","x",letters
  )
}

leaf<-function(id){
  
  
  leaflet::leafletOutput("x"
  )
}


testthat:: test_that("sliderInput01() creates expected HTML", {
  testthat:: local_edition(3)
  testthat:: expect_snapshot(sliderInput01("x"))
  
  testthat:: expect_snapshot(leaf("x"))
  
})

#snapshot_review("")
