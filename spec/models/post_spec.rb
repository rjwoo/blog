require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "validations" do
    it "requires a title" do
      p = Post.new
      result = p.valid?
      expect(p.errors).to have_key(:title)
    end

    it "requires title length to be min length of 7" do
      p = Post.new
      result = p.valid?
      expect(p.errors).to have_key(:title)
    end

    it "requires a body" do
      p = Post.new
      result = p.valid?
      expect(p.errors).to have_key(:body)
    end
  end
end
