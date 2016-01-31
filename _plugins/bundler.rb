require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

module Liquid
  VariableStart               = /\{\$/
  VariableEnd                 = /\$\}/
end

