class OpenLibraryService
  def self.call(*args, &block)
    new(*args, &block).execute
  end
  def initialize(bibkeys)
    @bibkeys = bibkeys
  end
  def execute
    response = HTTParty.get('https://openlibrary.org/api/books?bibkeys='+ @bibkeys +'&format=json&jscmd=data')
    response
  end
end