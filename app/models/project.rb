class Project < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name       :string, :required
    start_date :date
    author     :string
    end_date   :date
    timestamps
  end
  
  has_many :stories
  has_many :attachments
  belongs_to :user
  belongs_to :category
  
  children :attachments

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

  # attr_accessible :title, :body
end
