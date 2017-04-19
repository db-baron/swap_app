class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end
end  
