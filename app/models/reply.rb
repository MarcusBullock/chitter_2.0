class Reply
  include DataMapper::Resource

  property :id, Serial
  property :peeps, String, length: 150, required: true
  property :time, Time

  belongs_to :user
  belongs_to :peep

end
