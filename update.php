<?php
// Include config file
require_once "config.php";

// Define variables and initialize with empty values
$id = 0;
$name = "";
$place = "";
$review = "";
$rating = 0;
$name_err = $place_err = $review_err = $rating_err = "";

// Processing form data when form is submitted
if (isset($_POST["id"]) && !empty($_POST["id"])) {
    // Get hidden input value
    $id = $_POST["id"];

    // Validate name
    $input_name = trim($_POST["name"]);
    if (empty($input_name)) {
        $name_err = "Please enter a name.";
    } elseif (!filter_var($input_name, FILTER_VALIDATE_REGEXP, array("options" => array("regexp" => "/^[a-zA-Z\s]+$/")))) {
        $name_err = "Please enter a valid name.";
    } else {
        $name = $input_name;
    }

    // Validate place
    $input_place = trim($_POST["place"]);
    if (empty($input_place)) {
        $place_err = "Please enter a place.";
    } else {
        $place = $input_place;
    }

    // Validate review
    $input_review = trim($_POST["review"]);
    if (empty($input_review)) {
        $review_err = "Please enter a review.";
    } else {
        $review = $input_review;
    }

    // Validate rating
    $input_rating = $_POST["rating"];
    if (empty($input_rating)) {
        $rating_err = "Please enter a rating.";
    } else if ($input_rating > 10 || $input_rating < 1) {
        $rating_err = "Rating of a place should be between 1 and 10.";
    } else {
        $rating = $input_rating;
    }

    // Check input errors before inserting in database
    if (empty($name_err) && empty($place_err) && empty($review_err) && empty($rating_err)) {
        // Prepare an update statement
        $sql = "UPDATE reviews SET name=?, place=?, review=?, rating=? WHERE id=?";

        if ($stmt = mysqli_prepare($link, $sql)) {
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "ssssi", $param_name, $param_place, $param_review, $param_rating, $param_id);

            // Set parameters
            $param_id = $id;
            $param_name = $name;
            $param_place = $place;
            $param_review = $review;
            $param_rating = $rating;

            // Attempt to execute the prepared statement
            if (mysqli_stmt_execute($stmt)) {
                // Records updated successfully. Redirect to landing page
                header("location: review.php");
                exit();
            } else {
                echo "Oops! Something went wrong. Please try again later.";
            }
        }

        // Close statement
        mysqli_stmt_close($stmt);
    }

    // Close connection
    mysqli_close($link);
} else {
    // Check existence of id parameter before processing further
    if (isset($_GET["id"]) && !empty(trim($_GET["id"]))) {
        // Get URL parameter
        $id =  trim($_GET["id"]);

        // Prepare a select statement
        $sql = "SELECT * FROM reviews WHERE id = ?";
        if ($stmt = mysqli_prepare($link, $sql)) {
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "i", $param_id);

            // Set parameters
            $param_id = $id;

            // Attempt to execute the prepared statement
            if (mysqli_stmt_execute($stmt)) {
                $result = mysqli_stmt_get_result($stmt);

                if (mysqli_num_rows($result) == 1) {
                    /* Fetch result row as an associative array. Since the result set
                    contains only one row, we don't need to use while loop */
                    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);

                    // Retrieve individual field value
                    $name = $row["name"];
                    $place = $row["place"];
                    $review = $row["review"];
                    $rating = $row["rating"];
                } else {
                    // URL doesn't contain valid id. Redirect to error page
                    header("location: error.php");
                    exit();
                }
            } else {
                echo "Oops! Something went wrong. Please try again later.";
            }
        }

        // Close statement
        mysqli_stmt_close($stmt);

        // Close connection
        mysqli_close($link);
    } else {
        // URL doesn't contain id parameter. Redirect to error page
        header("location: error.php");
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Update Record</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        form {
            margin: 50px;
        }
    </style>
    <link rel="stylesheet" href="project.css">
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h2 class="mt-5">Update Review</h2>
                <form action="<?php echo htmlspecialchars(basename($_SERVER['REQUEST_URI'])); ?>" method="post">
                    <input type="hidden" name="id" value="<?php echo $id; ?>" />
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="name" class="form-control <?php echo (!empty($name_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $name; ?>">
                        <span class="invalid-feedback"><?php echo $name_err; ?></span>
                    </div>

                    <div class="form-group">
                        <label>Place</label>
                        <input type="text" name="place" class="form-control <?php echo (!empty($place_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $place; ?>">
                        <span class="invalid-feedback"><?php echo $place_err; ?></span>
                    </div>
                    <div class="form-group">
                        <label>Write some review</label>
                        <input type="text" name="review" class="form-control <?php echo (!empty($review_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $review; ?>">
                        <span class="invalid-feedback"><?php echo $review_err; ?></span>
                    </div>

                    <div class="form-group">
                        <label>Rate the place</label>
                        <input type="number" name="rating" class="form-control <?php echo (!empty($rating_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $rating; ?>">
                        <span class="invalid-feedback"><?php echo $rating_err; ?></span>
                    </div>

                    <input type="submit" class="btn btn-primary" value="Submit">
                    <a href="review.php" class="btn btn-secondary ml-2">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</body>

</html>