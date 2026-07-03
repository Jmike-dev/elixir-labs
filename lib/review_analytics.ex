defmodule ReviewAnalytics do
  @moduledoc """
  Documentation for `ReviewAnalytics`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ReviewAnalytics.hello()
      :world

  """
  def get_reviews do
[
%{id: 1, user: "Alice", rating: 5, comment: "Amazing service!", date: ~D[2025-01-15]
},
%{id: 2, user: "Brian", rating: 3, comment: "Average experience.", date: ~D[2025-01-18]
},
%{id: 3, user: "Carol", rating: 4, comment: "Very good.", date: ~D[2025-01-12]
},
%{id: 4, user: "David", rating: 2, comment: "Needs improvement.", date: ~D[2025-01-10]
},
%{id: 5, user: "Eve", rating: 5, comment: "Excellent!", date: ~D[2025-01-20]
},
%{id: 6, user: "Frank", rating: 1, comment: "Terrible experience.", date: ~D[2025-01-08]
}
]  end

def count_review do
  get_reviews() |> length()

end

def average_rating do
  average = get_reviews() |> Enum.map(fn review -> review.rating end)
  Enum.sum(average) / length(average)
end

def highest_rating do
  get_reviews()|>Enum.map(fn review -> review.rating end)|>Enum.max()

end

def lowest_rating do
    get_reviews()|>Enum.map(fn review -> review.rating end)|>Enum.min()


end

def five_star_reviews do
    get_reviews()|>Enum.filter(fn reviews -> reviews.rating == 5 end)
end

end
