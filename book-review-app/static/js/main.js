// this page was created by @abdiraqiibhassan
//This JavaScript code handles the review form submission by validating user input, sending the review data to the backend via a POST request, 
// and refreshing the page after a successful submission

document.getElementById("reviewForm").addEventListener("submit", async (event) => {
  event.preventDefault();

  const name = document.getElementById("name").value;
  const rating = document.getElementById("rating").value;
  const comment = document.getElementById("comment").value;

  if (!name || !rating || !comment) {
    alert("Please fill out all fields.");
    return;
  }

  const reviewData = {
    book_id: bookId, // `bookId` is passed from the template
    reviewer_name: name,
    rating: parseInt(rating, 10),
    comment: comment,
  };

  try {
    const response = await fetch("/review", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(reviewData),
    });

    if (response.ok) {
      const result = await response.json();
      alert(result.message);

      // Optionally, reload the page or dynamically update the reviews list
      location.reload();
    } else {
      const error = await response.json();
      alert(error.error || "Failed to submit review.");
    }
  } catch (err) {
    console.error("Error submitting review:", err);
    alert("An error occurred. Please try again.");
  }
});