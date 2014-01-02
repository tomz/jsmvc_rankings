class StatsLog
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :stars, type: Integer
  field :forks, type: Integer
  field :commits, type: Integer
  field :authors, type: Integer
  field :issues, type: Integer
  
  belongs_to :repository
  
  index({repository_id: 1, created_at: -1})
  index({created_at: -1})
end