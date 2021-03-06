class Article < ActiveRecord::Base
    has_rich_text :description
    belongs_to :user
    belongs_to :category
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    validates :user_id, presence: true
    validates :category_id, presence: true
    end