require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "validations" do
    it "requires a title" do
      p = Post.new
      result = c.valid?
      expect(c.errors).to have_key(:title)
    end

    


    end


  end

end
