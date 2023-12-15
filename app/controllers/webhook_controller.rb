class WebhookController < ApplicationController
  include HTTParty
  skip_before_action :verify_authenticity_token

  def create
    @product = Product.new(webhook_params)
    if @product.save
      TwilioNotificationService.new(@product).send_sms('create', @product.phone_number)
      render json: { message: 'Record created successfully' }, status: :created
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(webhook_params)
      TwilioNotificationService.new(@product).send_sms('update', @product.phone_number)
      render json: { message: 'Record updated successfully' }, status: :ok
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def webhook_params
    params.permit(:name, :data, :phone_number)
  end
end
