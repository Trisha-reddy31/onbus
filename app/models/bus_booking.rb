class BusBooking < ApplicationRecord
  validates :pnr, presence: true, uniqueness: true
  validates :bus_name, presence: true
  validates :fare, presence: true, numericality: { greater_than_or_equal_to: 0 }

  before_validation :generate_unique_pnr, on: :create

  private

  def generate_unique_pnr
    self.pnr ||= loop do
      random_pnr = "PNR#{SecureRandom.hex(4).upcase}"
      break random_pnr unless BusBooking.exists?(pnr: random_pnr)
    end
  end
end
