$(function () {
    $("#add-exercise-form").validate({
        rules: {
            txtExerciseName: {
                required: true
            },
            txtExerciseDescription: {
                required: true
            }
        },
        messages: {
            txtExerciseName: {
                required: "Exercise name cannot be empty!"
            },
            txtExerciseDescription: {
                required: "Exercise description cannot be empty!"
            }
        }
    });
});


$(document).ready(function() {
    // Add custom validation method to check if meal form has at least one selected food item
    $.validator.addMethod("hasSelectedFood", function(value, element) {
      // Check if the table has any rows (selected foods)
      return $('#table_id tbody tr').length > 0;
    }, "Please select at least one food item");
  
    // Add validation rules to the meal form
    $('#meal-form').validate({
      rules: {
        // Call the custom validation method to check if meal form has at least one selected food item
        selectedFood: {
          hasSelectedFood: true
        }
      },
      messages: {
        selectedFood: {
          hasSelectedFood: "Please select at least one food item"
        }
      },
      errorPlacement: function(error, element) {
        // Add error message next to the meal form button
        error.appendTo($('#meal-form-error'));
      }
    });
  });
  