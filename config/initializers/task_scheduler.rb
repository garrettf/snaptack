scheduler = Rufus::Scheduler.new

scheduler.every("1h") do
   Board.cleanup! 1.hour.ago
end 
