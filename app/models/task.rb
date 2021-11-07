class Task < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true

  validates :name, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validates :description, length: { maximum: 500 }

  state_machine :initial => :new_task do
    state :new_task
    state :in_development
    state :in_qa
    state :in_code_review
    state :ready_for_release
    state :released
    state :archived

    event :develop do
      transition :new_task => :in_development
      transition :in_qa => :in_development
      transition :in_code_review => :in_development
    end
    event :arhive do
      transition :new_task => :archived
      transition :released => :archived
    end
    event :qa do
      transition :in_development => :in_qa
    end
    event :code_review do
      transition :in_qa => :in_code_review
    end
    event :ready_for_release do
      transition :in_code_review => :ready_for_release
    end
    event :release do
      transition :ready_for_release => :released
    end
  end
end
