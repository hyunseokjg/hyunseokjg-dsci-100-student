library(testthat)
library(digest)

# Round double to precise integer
#
# `int_round` works to create an integer corresponding to a number that is 
# tested up to a particular decimal point of precision. This is useful when 
# there is a need to compare a numeric value using hashes.
#
# @param x Double vector of length one.
# @param digits Double vector of length one to specify decimal point of precision. Negative numbers can be used to specifying significant digits > 0.1.
#
# @return Integer vector of length one corresponding to a particular decimal point of precision.
#
# @examples
# # to get an integer up to two decimals of precision from 234.56789
# int_round(234.56789, 2)
#
# to get an integer rounded to the hundred digit from 234.56789
# int_round(234.56789, -2)
int_round <- function(x, digits){
    x = x*10^digits
    xint = as.integer(x)
    xint1 = xint + 1L
    if (abs(xint - x) < abs(xint1 - x)){
        return(xint)
    }
    else {
        return(xint1)
    }
}
# -
test_0.1 <- function(){
    test_that('Solution is incorrect', {
        expect_equal(digest(A), 'db8e490a925a60e62212cefc7674ca02') # we hid the answer to the test here so you can't see it, but we can still run the test
        expect_equal(digest(B), 'e5b57f323c7b3719bbaaf9f96b260d39') # we hid the answer to the test here so you can't see it, but we can still run the test
        expect_equal(digest(C), '6717f2823d3202449301145073ab8719') # we hid the answer to the test here so you can't see it, but we can still run the test
        expect_equal(digest(D), 'dbc09cba9fe2583fb01d63c70e1555a8') # we hid the answer to the test here so you can't see it, but we can still run the test
        expect_equal(digest(E), '0aee9b78301d7ec8998971363be87c03') # we hid the answer to the test here so you can't see it, but we can still run the test
        expect_equal(digest(F), '5e338704a8e069ebd8b38ca71991cf94') # we hid the answer to the test here so you can't see it, but we can still run the test
        })
print("Success!")
    }

test_0.2 <- function(){
    test_that('Solution is incorrect', {
        expect_equal(digest(answer0.2), '05ca18b596514af73f6880309a21b5dd') # we hid the answer to the test here so you can't see it, but we can still run the test
        })
print("Success!")
    }

test_1.1 <- function(){
    test_that('Solution is incorrect', {
        expect_equal(digest(answer1.1), '0590b0427c1b19a6eb612d19888aa52f') # we hid the answer to the test here so you can't see it, but we can still run the test
        })
print("Success!")
    }

test_1.2 <- function(){
    test_that('Solution is incorrect', {
        expect_equal(digest(answer1.2), '75f1160e72554f4270c809f041c7a776') # we hid the answer to the test here so you can't see it, but we can still run the test    
        })
print("Success!")
    }

test_1.3 <- function(){
    test_that('Did not create an object named insurance', {
        expect_true(exists("insurance")) 
        })
    test_that('insurance should be a data frame.', {
        expect_true('data.frame' %in% class(insurance))
        })
    test_that('insurance does not contain the correct number of rows and/or columns.', {
        expect_equal(dim(insurance), c(1338, 7))
        })
    test_that('Columns in insurance contain incorrect values.', {
        expect_equal(digest(int_round(sum(insurance$age), 2)), 'de3a0ef8b98df33e016e2f91ab060fb5')
        expect_equal(digest(int_round(length(unique(insurance$region)), 0)), '234a2a5581872457b9fe1187d1616b13') # we hid the answer to the test here so you can't see it, but we can still run the test
        })
print("Success!")
    }

test_1.5 <- function(){
    properties <- c(bmi_plot$layers[[1]]$mapping, bmi_plot$mapping)
    labels <- bmi_plot$labels
    test_that('Did not create a plot named bmi_plot', {
        expect_true(exists("bmi_plot")) 
        })
    test_that('bmi should be on the x-axis.', {
        expect_true("bmi" == rlang::get_expr(properties$x))
        })
    test_that('charges should be on the y-axis.', {
        expect_true("charges" == rlang::get_expr(properties$y))
        })
    test_that('bmi_plot should be a scatter plot.', {
        expect_true("GeomPoint" %in% c(class(bmi_plot$layers[[1]]$geom)))
        })
    test_that('Labels on the axes and legend should be descriptive and human readable.', {
        expect_false((labels$y) == 'charges')
        expect_false((labels$x) == 'bmi')
        })
print("Success!")
    }


test_1.9.0 <- function(){
    test_that('Solution is incorrect', {
        expect_equal(digest(answer1.9.0), 'd2a90307aac5ae8d0ef58e2fe730d38b') # we hid the answer to the test here so you can't see it, but we can still run the test
        })
print("Success!")
    }

test_1.9.1 <- function(){
    test_that('Solution is incorrect', {
        expect_equal(digest(answer1.9.1), '05ca18b596514af73f6880309a21b5dd') # we hid the answer to the test here so you can't see it, but we can still run the test
        })
print("Success!")
    }

test_1.10_old <- function(){
    test_that('Did not create a plot named bar_plot', {
        expect_true(exists("bar_plot")) 
        })
    # test_that('Count up the number of rows.')
        # expect 
    test_that('sex should be on the x-axis.', {
        expect_true("sex" %in% c(rlang::get_expr(bar_plot$mapping$x),rlang::get_expr(bar_plot$layers[[1]]$mapping$x)))
        })
    test_that('bar_plot should map smoker to the colour filled in the bars.', {
        expect_equal(digest(as.character(rlang::get_expr(bar_plot$mapping$fill))) , '059bc865bfafc56a35be79573fc6f02b')
        })
    test_that('bar_plot should be a bar chart.', {
        expect_true("GeomBar" %in% c(class(bar_plot$layers[[1]]$geom)))
        })
    test_that('Label for the legend should be descriptive and human readable.', {
        expect_equal(digest(bar_plot$labels$fill), '2ba2a41537b71ba968e6f15e9d2f914e')
        })
# Need to test for position = fill  
print("Success!")
    }

test_1.10 <- function(){
    properties <- c(bar_plot$layers[[1]]$mapping, bar_plot$mapping)
    labels <- bar_plot$labels
    test_that('Did not create a plot named bar_plot', {
        expect_true(exists("bar_plot")) 
        })
    test_that('sex should be on the x-axis.', {
        expect_true("sex" == rlang::get_expr(properties$x))
        })
    test_that('the smoker variable should be used to colour fill the bars.', {
        expect_true("smoker" == rlang::get_expr(properties$fill))
        })
    test_that('bar_plot should be a bar plot.', {
        expect_true("GeomBar" %in% c(class(bar_plot$layers[[1]]$geom)))
        })
    test_that('bar_plot position should be fill', {
        expect_true("PositionFill" %in% class(bar_plot$layers[[1]]$position))
        })
    test_that('Labels on the axes and legend should be descriptive and human readable.', {
        expect_false((labels$x) == 'sex')
        expect_false((labels$fill) == 'smoker')
        })
print("Success!")
    }

test_1.11 <- function(){
    test_that('Solution is incorrect', {
        expect_equal(digest(answer1.11), 'a92f67bf4e1efa7b94661c5af29effc2') # we hid the answer to the test here so you can't see it, but we can still run the test
        })
print("Success!")
    }
