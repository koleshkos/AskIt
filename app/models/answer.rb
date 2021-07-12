class Answer < ApplicationRecord
  belongs_to :question, dependent: :destroy

  validates :body, presence: true, length: {minimum: 5} 

  def formated_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
