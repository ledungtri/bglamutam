module ClassroomRelationship
  extend ActiveSupport::Concern

  included do
    belongs_to :classroom

    validates_presence_of :classroom_id

    default_scope { includes(:classroom) }
    default_scope { order('classrooms.year') }
    scope :for_year, -> (year) { where('classrooms.year' => year) }

    delegate :year, to: :classroom
  end
end