defmodule ReviewAnalytics do
  @moduledoc """
  A simple review analytics module for an online marketplace.
  Reviews are hardcoded (no database or files) and processed using pure Elixir.
  """

  # ---------------------------------------------------------------------
  # Data
  # ---------------------------------------------------------------------

  @doc """
  Returns the hardcoded list of reviews.
  """
  def get_reviews do
    [
      %{id: 1, user: "Alice", rating: 5, comment: "Amazing service!", date: ~D[2025-01-15]},
      %{id: 2, user: "Brian", rating: 3, comment: "Average experience.", date: ~D[2025-01-18]},
      %{id: 3, user: "Carol", rating: 4, comment: "Very good.", date: ~D[2025-01-12]},
      %{id: 4, user: "David", rating: 2, comment: "Needs improvement.", date: ~D[2025-01-10]},
      %{id: 5, user: "Eve", rating: 5, comment: "Excellent!", date: ~D[2025-01-20]},
      %{id: 6, user: "Frank", rating: 1, comment: "Terrible experience.", date: ~D[2025-01-08]}
    ]
  end

  # ---------------------------------------------------------------------
  # Part A - Basic Functions
  # ---------------------------------------------------------------------

  @doc "Returns the total number of reviews."
  def count_reviews do
    get_reviews()
    |> length()
  end

  @doc "Returns the average rating, rounded to 2 decimal places."
  def average_rating do
    reviews = get_reviews()
    total = Enum.reduce(reviews, 0, fn review, acc -> acc + review.rating end)

    (total / count_reviews())
    |> Float.round(2)
  end

  @doc "Returns the highest rating among all reviews."
  def highest_rating do
    get_reviews()
    |> Enum.map(& &1.rating)
    |> Enum.max()
  end

  @doc "Returns the lowest rating among all reviews."
  def lowest_rating do
    get_reviews()
    |> Enum.map(& &1.rating)
    |> Enum.min()
  end

  # ---------------------------------------------------------------------
  # Part B - Filtering
  # ---------------------------------------------------------------------

  @doc "Returns only the 5-star reviews."
  def five_star_reviews do
    filter_reviews(5)
  end

  @doc "Returns reviews matching the given rating value."
  def filter_reviews(rating) do
    get_reviews()
    |> Enum.filter(&(&1.rating == rating))
  end

  # ---------------------------------------------------------------------
  # Part C - Sorting
  # ---------------------------------------------------------------------

  @doc """
  Sorts all reviews by rating.
  `order` accepts `:asc` or `:desc` and defaults to `:asc`.
  """
  def sort_by_rating(order \\ :asc) do
    get_reviews()
    |> Enum.sort_by(& &1.rating, order)
  end

  @doc """
  Sorts all reviews by date.
  `order` accepts `:asc` or `:desc` and defaults to `:asc`.
  """
  def sort_by_date(order \\ :asc) do
    get_reviews()
    |> Enum.sort_by(& &1.date, {order, Date})
  end
end
