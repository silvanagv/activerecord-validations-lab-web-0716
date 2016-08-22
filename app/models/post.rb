


class Post < ActiveRecord::Base
# def title_must_be_clickbait
#    unless title.include? "Won't Believe" || "Secret" || "Top" || "Guess"
#      errors.add(:title, "some error")
#    end
# end


# validates :title, presence: true
# validates_inclusion_of :title, in: :available_titles

# validates_inclusion_of :title, in: ["You Won't Believe These True Facts", "f" ]

# validates :title, presence: true, format: { with: /\A((http|https):\/\/)?(www.)?facebook.com\//,
# message: "use a valid facebook url" }
  # validate :title_must_be_clickbait

  validate :is_clickbait?

   CLICKBAIT_PATTERNS = [
     /Won't Believe/i,
     /Secret/i,
     /Top [0-9]*/i,
     /Guess/i
   ]

   def is_clickbait?
     if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
       errors.add(:title, "must be clickbait")
     end
   end
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, presence: true
  validates_inclusion_of :category, in: ["Fiction", "Non-Fiction" ]


end
