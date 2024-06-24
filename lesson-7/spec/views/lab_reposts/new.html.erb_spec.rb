require 'rails_helper'

RSpec.describe "lab_reposts/new", type: :view do
  before(:each) do
    assign(:lab_repost, LabRepost.new())
  end

  it "renders new lab_repost form" do
    render

    assert_select "form[action=?][method=?]", lab_reposts_path, "post" do
    end
  end
end
