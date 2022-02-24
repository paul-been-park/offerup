require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:messages) }

    it { should have_many(:listings) }

    end

    describe "InDirect Associations" do

    it { should have_many(:item_listings) }

    end

    describe "Validations" do

    end
end
