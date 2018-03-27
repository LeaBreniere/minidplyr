context("test-select.R")

test_that("select2 works for character vectors", {
  for (ind in list("Species", c("Sepal.Length", "Species"), names(iris), character(0))) {
    iris_sub <- select2(iris, ind)
    expect_equal(iris_sub, dplyr::select(iris, ind))
    expect_is(iris_sub, "data.frame")
    expect_equal(dim(iris_sub), c(nrow(iris), length(ind)))
    expect_equal(names(iris_sub), ind)
  }
})

test_that("select2 works for logical vectors", {
  for (ind in list(c(TRUE, FALSE, TRUE, FALSE, TRUE),
                    c(TRUE, FALSE, FALSE, FALSE, FALSE),
                    rep(TRUE, 5), rep(FALSE, 5))) {
    iris_sub <- select2(iris, ind)
    expect_equal(iris_sub, dplyr::select_if(iris, ind))
    expect_is(iris_sub, "data.frame")
    expect_equal(dim(iris_sub), c(nrow(iris), sum(ind)))
    expect_equal(names(iris_sub), names(dplyr::select_if(iris, ind)))
  }
})
