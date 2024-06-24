require 'rails_helper'

RSpec.describe "lab_reposts/show", type: :view do
  before(:each) do
    assign(:lab_repost, LabRepost.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
