require 'rails_helper'

RSpec.describe Message, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:listing) }

    it { should belong_to(:prospective_buyer) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
