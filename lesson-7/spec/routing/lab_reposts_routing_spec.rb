require "rails_helper"

RSpec.describe LabRepostsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lab_reposts").to route_to("lab_reposts#index")
    end

    it "routes to #new" do
      expect(get: "/lab_reposts/new").to route_to("lab_reposts#new")
    end

    it "routes to #show" do
      expect(get: "/lab_reposts/1").to route_to("lab_reposts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/lab_reposts/1/edit").to route_to("lab_reposts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lab_reposts").to route_to("lab_reposts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lab_reposts/1").to route_to("lab_reposts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lab_reposts/1").to route_to("lab_reposts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lab_reposts/1").to route_to("lab_reposts#destroy", id: "1")
    end
  end
end
