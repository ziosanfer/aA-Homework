require 'set'
class GraphNode
    attr_reader :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def neighbors=(new_neighbors)
        @neighbors += new_neighbors
    end

end

def bfs(start_node, target)
    queue = [start_node]
    visited = []
    until queue.empty?
        node = queue.shift
        if visited.include?(node)
            next
        elsif node.value == target
            return node.value
        else
           queue += node.neighbors
        end
        visited << node
    end
    return nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
p bfs(a, "e")
p bfs(a, "f")