# Return solution to system of equations if matrix is nonsingular
my_solve <- function(A, b) {

    # Catch output
    tryCatch({

        # Solve and return column vector
        t(t(solve(A, b)))

    }, error = function(e) {

        # Get error message
        msg <- conditionMessage(e)

        # Reformat to match spec from problem set
        if (grepl("exactly singular", msg)) {
            print("It does not have a unique solution")
        } else {
            stop(msg)
        }

    })

}
