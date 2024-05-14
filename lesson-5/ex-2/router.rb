module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.to_s.chomp
      break if verb == 'q'

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.to_s.chomp
        if action == 'q'
          break
        elsif %w[index show].include?(action)
          routes[verb][action].call
        else
          puts 'Incorrect action'
        end
      elsif %w[POST PUT DELETE].include?(verb)
        routes[verb].call
      else
        puts 'Incorrect verb'
      end
    end
  end
end

class PostController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    index = 0
    @posts.each do |item|
      puts "#{index}: #{item}"
    end
  end

  def show
    id_post = input_id_post
    return nil if id_post.nil?

    puts "#{id_post}: #{@posts[id_post]}"
  end

  def create
    text = input_text
    return nil if text.nil?

    @posts.push(text)
    puts "#{@posts.length - 1}: #{text}"
  end

  def update
    id_post = input_id_post
    return nil if id_post.nil?

    text = input_text
    return nil if text.nil?

    @posts[id_post] = text

    puts "#{id_post}: #{@posts[id_post]}"
  end

  def destroy
    id_post = input_id_post
    return nil if id_post.nil?

    @posts.delete_at(id_post)
  end

  private

  def input_id_post
    print 'Input id post: '
    id_post = gets.to_s.chomp.to_i
    if id_post.negative? || id_post >= @posts.length
      puts 'Error: incorrect id post'
      puts 'Hint: should not be negative and exist'
      return nil
    end
    id_post
  end

  def input_text
    print 'Input text: '
    text = gets.to_s.chomp
    if text == ''
      puts 'Error: incorrect text'
      puts 'Hint: must not be empty'
      return nil
    end
    text
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostController, 'posts')
    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choose = gets.to_s.chomp

      if choose == '1'
        PostController.connection(@routes['posts'])
      elsif choose == 'q'
        break
      end
    end

    puts 'Good bye!'
  end

  def resources(post_controller, keyword)
    controller = post_controller.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init
