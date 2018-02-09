class SleepyController < ApplicationController
  include ActionController::Live

  def wait
    @time = params[:time].to_f / 1000.0
    sleep @time
  end


  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    @time = params[:time].to_f / 1000.0
    @steps = params[:steps].to_i
    response.stream.write "Waiting for #{@time} seconds, #{@steps} times...\n"
    @steps.times do |index|
      sleep @time
      response.stream.write "Slept #{index + 1}\n"
    end
    response.stream.write 'Done'
  ensure
    response.stream.close
  end
end
