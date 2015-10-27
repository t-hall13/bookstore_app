require 'rails_helper'

describe Publisher, :type => :model do 
   it { should validate_presence_of(:name)}
   it { should validate_uniqueness_of(:name).case_insensitive}
end