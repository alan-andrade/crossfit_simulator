#encoding: utf-8

finish = start = Time.now
timer = Thread.new do
  loop do
    sleep 0.2
    finish = Time.now - start
    print "\r#{sprintf("%2.2f", finish)}"
  end
end

control = Thread.new do
  exercises = ['15 pushups', '10 pull ups']
  current_exercise = exercises.pop
  loop do
    puts current_exercise
    char = $stdin.getc
    if char == "\n"
      #print "√ #{current_exercise} : #{finish} \n\n"
      print "\n\n"
      current_exercise = exercises.pop
      current_exercise.nil? && exit(0)
    end
  end
end

control.join
timer.join
