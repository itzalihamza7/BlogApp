# frozen_string_literal: true

class OptimismChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'OptimismChannel'
  end
end
