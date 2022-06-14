class ChangeReviewReferenceToTripDayts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :reviews, :user
    remove_reference :reviews, :dayt
    add_reference :reviews, :trip_dayt
  end
end
