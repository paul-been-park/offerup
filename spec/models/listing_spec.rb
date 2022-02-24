require 'rails_helper'

RSpec.describe Listing, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:messages) }

    it { should belong_to(:seller) }

    end

    describe "InDirect Associations" do

    it { should have_many(:prospective_buyers) }

    end

    describe "Validations" do

    end
end
