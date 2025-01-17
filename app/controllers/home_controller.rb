# frozen_string_literal: true

# Home Page Controller
class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html { render 'index' }
      format.json { render json: { message: 'Welcome to the homepage' } }
    end
  end

  def readme_preview
    readme_path = Rails.root.join('README.md')
    @readme_content = File.read(readme_path)
  end
end
