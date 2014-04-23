scheduler = Rufus::Scheduler.new

scheduler.every("1h") do
   ApplicationController.cleanup! 1.hour.ago
end 
