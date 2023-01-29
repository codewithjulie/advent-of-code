file = File.open("day-12-short.txt")

data = file.readlines.map(&:chomp).map { |line| line.split("-")}

p data

class Node
  attr_accessor :value, :neighbors, :neighbors_values
  def initialize(value)
    @value = value
    @neighbors = []
    @neighbors_values = []
  end

  def add_neighbor(node)
    if !@neighbors_values.include?(node)
      @neighbors << node
      @neighbors_values = @neighbors.map { |neighbor| neighbor.value}
    end
  end
end

class Graph
  attr_accessor :nodes
  def initialize
    @nodes = []
    @values = []
  end

  def add_node(value)
    if !@values.include?(value)
      @nodes << Node.new(value)
      @values = nodes.map {|node| node.value}
    end
  end
end

my_graph = Graph.new

data.each do |edge|
  my_graph.add_node(edge.first)
  my_graph.add_node(edge.last)

  node_1 = my_graph.nodes.find { |node| node.value == edge.first}
  node_2 = my_graph.nodes.find { |node| node.value == edge.last}

  node_1.add_neighbor(node_2)
  node_2.add_neighbor(node_1)
end

# node = my_graph.nodes.find { |node| node.value == "A"}
# p node.neighbors_values


def find_path(start, final, path = [start], visited = [start])
  up_next = []


  up_next += start.neighbors
  up_next.each do |node|
    return if node == final
    if !(visited.include?(node) && node.value.downcase == node.value)
      visited << node
      path << node
      up_next.shift
      find_path(node, final, path, visited)
    end
  end

end

start = my_graph.nodes.find { |node| node.value == "start"}
final = my_graph.nodes.find { |node| node.value == "end"}



path = find_path(start, final)
path = path.map {|node| node.value}