module Doodler
  module Notification
    def notify_start
      puts "Doodler starts drawing! ...\n"
    end

    def notify_complete
      puts "Doodler completes drawing! Image is saved in image\/render\/output.png \n"
    end
  end
end