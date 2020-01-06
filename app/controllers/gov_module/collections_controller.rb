module GovModule
  class CollectionsController < ApplicationController
    def index
      @collections = Accounting::Entry.all
    end
  end
end
