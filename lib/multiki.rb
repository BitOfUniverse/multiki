class Multiki
  include Enumerable
  def initialize(tasks, concurrency: 10)
    @concurrency = concurrency
    @queue = Queue.new

    self.<< tasks
  end

  def <<(tasks)
    [*tasks].each do |task|
      @queue.push task
    end
  end

  def each(&block)
    run(&block)
  end

  private

  def run(&block)
    players(&block).each(&:join)
  end

  def players(&block)
    threads_number = [@concurrency || @queue.size].max

    threads_number.times.map do
      player(&block)
    end
  end

  def player
    Thread.new do
      while !@queue.empty?
        begin
          task = @queue.pop
          yield task.call
        rescue StandardError => e
          puts "Unhandled error: #{e.inspect}"
        end
      end
    end
  end
end

