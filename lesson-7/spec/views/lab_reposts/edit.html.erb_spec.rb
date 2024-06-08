require 'rails_helper'

RSpec.describe "lab_reposts/edit", type: :view do
  let(:lab_repost) {
    LabRepost.create!()
  }

  before(:each) do
    assign(:lab_repost, lab_repost)
  end

  it "renders the edit lab_repost form" do
    render

    assert_select "form[action=?][method=?]", lab_repost_path(lab_repost), "post" do
    end
  end
end
