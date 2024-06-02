# frozen_string_literal: true

class Request
  attr_accessor :path, :full_path, :protocol, :params

  def initialize(text)
    @path, @full_path, @protocol = String(text).split
    @params = {}
    value = String(@full_path).split('?')

    return unless value.count == 2

    String(value[1]).split('&').each do |element|
      value = element.split('=')
      @params[value[0].to_sym] = value.empty? ? nil : value[1]
    end
  end
end
