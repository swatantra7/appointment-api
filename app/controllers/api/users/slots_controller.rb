module Api
  module Users
    class SlotsController < ApplicationController

      def index
        slots = Users::Slot.avaliable
        render json: slots, status: 200 and return
      end

    end
  end
end