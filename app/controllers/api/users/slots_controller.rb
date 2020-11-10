module Api
  module Users
    class SlotsController < Api::UsersController

      def index
        slots = ::Users::Slot.avaliable
        slots = slots.as_api_response(:details)
        render json: { status: true, slots: slots }, status: 200
      end

    end
  end
end