context("test-filter.R")

test_that("filter2 works for character vectors", {
  for (ind in list("1", c("1", "2"), rownames(iris), character(0))) {
    iris_sub <- filter2(iris, ind)
    expect_equal(iris_sub, dplyr::filter(iris, ind))
    expect_is(iris_sub, "data.frame")
    expect_equal(dim(iris_sub), c(length(vars), ncol(iris)))
    expect_equal(colnames(iris_sub), colnames(iris))
  }
})

test_that("filter2 works for integer vectors", {
  for (ind in list(1,
                   c(TRUE, FALSE, FALSE, FALSE, FALSE),
                   rep(TRUE, 5), rep(FALSE, 5))) {
    iris_sub <- select2(iris, ind)
    expect_equal(iris_sub, dplyr::select_if(iris, ind))
    expect_is(iris_sub, "data.frame")
    expect_equal(dim(iris_sub), c(nrow(iris), sum(ind)))
    expect_equal(names(iris_sub), names(dplyr::select_if(iris, ind)))
  }
})