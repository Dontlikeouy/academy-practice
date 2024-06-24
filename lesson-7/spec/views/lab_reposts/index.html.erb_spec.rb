require 'rails_helper'

RSpec.describe "lab_reposts/index", type: :view do
  before(:each) do
    assign(:lab_reposts, [
      LabRepost.create!(),
      LabRepost.create!()
    ])
  end

  it "renders a list of lab_reposts" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
