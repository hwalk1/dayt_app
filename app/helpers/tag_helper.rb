module TagHelper
  TAG_NAMES = {
    "Outdoor" => "bg-secondary",
    "Indoor" => "bg-dark",
    "Brekky" => "bg-danger",
    "Lunch" => "bg-danger",
    "Dinner" => "bg-dark",
    "Nightlife" => "bg-success",
    "Nice Walk" => "bg-secondary",
    "Art" => "bg-light",
    "Sport" => "bg-light",
    "Music" => "bg-warning",
    "Maccas" => "bg-danger",
    "Drinks" => "bg-info",
    "Barbie & Smoko" => "bg-danger",
    "Free" => "bg-dark",
    "Le Wagon awesome course" => "bg-light"
  }

  def tag_class(tag_name)
    TAG_NAMES.fetch(tag_name, "bg-primary") #don't judge me
  end
end
