module Api
  module Users
    class AppointmentsController < Api::UsersController

      def index
        appointments = @current_app_user.appointments
        appointments = appointments.as_api_response(:details)
        render json: { status: true, appointments: appointments }, status: 200
      end

      def appointments
        appointments = @current_app_user.appointments.where(doctor_id: params[:doctor_id])
        appointments = appointments.as_api_response(:details)
        render json: { status: true, appointments: appointments }, status: 200
      end

      def create
        appointment = @current_app_user.appointments.new(
          users_slot_id: params[:slot_id],
          doctor_id: params[:doctor_id]
        )
        if appointment.save
          render json: {status: true, message: "Appointment Scheduled"}, status: 201 and return
        else
          render json: {status: false, message: appointment.errors.full_messages.join(', ')}, status: 422 and return
        end
      end

    end
  end
end