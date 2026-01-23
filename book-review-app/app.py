# this page was created by @abdiraqiibhassan

from flask import Flask, render_template, request, jsonify
from db import get_db_connection

app = Flask(__name__)


@app.route("/")
def index():
    conn = get_db_connection()
    cursor = conn.cursor(buffered=True, dictionary=True)

    cursor.execute("SELECT * FROM books")
    books = cursor.fetchall()

    cursor.close()
    conn.close()
    return render_template("index.html", books=books)


@app.route("/browse")
def browse():
    conn = get_db_connection()
    cursor = conn.cursor(buffered=True, dictionary=True)

    cursor.execute("SELECT * FROM books")
    books = cursor.fetchall()

    cursor.close()
    conn.close()
    return render_template("browse.html", books=books)

@app.route("/signin")
def signIn():
    return render_template("signIn.html")



@app.route("/signup")
def signUp():
    return render_template("signup.html")


@app.route("/contact")
def contact():
    return render_template("contact.html")


@app.route("/book/<int:book_id>")
def book(book_id):
    conn = get_db_connection()
    cursor = conn.cursor(buffered=True, dictionary=True)

    cursor.execute("SELECT * FROM books WHERE id = %s", (book_id,))
    book = cursor.fetchone()

    cursor.execute("SELECT * FROM reviews WHERE book_id = %s", (book_id,))
    reviews = cursor.fetchall()

    cursor.close()
    conn.close()
    return render_template("review-book.html", book=book, reviews=reviews)

@app.route("/review", methods=["POST"])
def add_review():
    data = request.get_json(silent=True)

    if not data:
        return jsonify({"error": "Invalid JSON data"}), 400

    book_id = data.get("book_id")
    reviewer_name = data.get("reviewer_name")
    rating = data.get("rating")
    comment = data.get("comment")

    if not all([book_id, reviewer_name, rating, comment]):
        return jsonify({
            "error": "book_id, reviewer_name, rating, and comment are required"
        }), 400

    conn = get_db_connection()
    cursor = conn.cursor(buffered=True, dictionary=True)

    cursor.execute(
        """
        INSERT INTO reviews (book_id, reviewer_name, rating, comment)
        VALUES (%s, %s, %s, %s)
        """,
        (book_id, reviewer_name, rating, comment)
    )

    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({"message": "Review added successfully"}), 201


# route to get all the reviews in the database on one page
@app.route("/all-reviews")
def all_reviews():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
        SELECT
          books.id AS book_id,
          books.title AS book_title,
          books.author AS book_author,
          reviews.reviewer_name,
          reviews.rating,
          reviews.comment,
          reviews.created_at
        FROM reviews
        JOIN books ON reviews.book_id = books.id
        ORDER BY reviews.created_at DESC
    """
    cursor.execute(query)
    reviews = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template("reviews.html", reviews=reviews)

if __name__ == "__main__":
    app.run(debug=True)