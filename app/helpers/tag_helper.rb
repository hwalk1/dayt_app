module TagHelper
  TAG_NAMES = {
    "Outdoor" => "bg-secondary",
    "Indoor" => "bg-dark",
    "Brekky" => "bg-danger",
    "Lunch" => "bg-danger",
    "Dinner" => "bg-danger",
    "Nightlife" => "bg-success",
    "Nice Walk" => "bg-secondary",
    "Art" => "bg-light",
    "Sport" => "bg-light",
    "Music" => "bg-warning",
    "Drinks" => "bg-info",
    "Free" => "bg-dark",
    "Awesome courses" => "bg-light",
    "Snacks" => "bg-danger",
    "Entertainment" => "bg-warning",
  }

  def tag_class(tag_name)
    TAG_NAMES.fetch(tag_name, "bg-primary") #don't judge me
  end
end
